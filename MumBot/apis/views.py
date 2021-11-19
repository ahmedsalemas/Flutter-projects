from django.shortcuts import render
from rest_framework import status
from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.views.decorators.csrf import csrf_exempt
from django.db.models import Count, F
from grad import models
from .serializers import *
import hashlib


# Create your views here.


@api_view(['POST', ])
@csrf_exempt
def api_parent_login(request):

    try:
        parent = models.Parent.objects.get(user_email=request.data["user_email"], user_password=hashlib.md5(
            request.data["user_password"].encode()).hexdigest())

    except models.Parent.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    serializer = ParentSerializer(parent)
    return Response(serializer.data, status=status.HTTP_200_OK)


@api_view(['POST', ])
@csrf_exempt
def api_specialist_login(request):
    try:
        specialist = models.Specialist.objects.get(user_email=request.data["user_email"], user_password=hashlib.md5(
            request.data["user_password"].encode()).hexdigest())

    except models.Specialist.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    serializer = SpecialistSerializer(specialist)
    return Response(serializer.data, status=status.HTTP_200_OK)


# This gets the parent Id and returns all of its data
@api_view(['GET', ])
def api_parent_view(request, id):
    try:
        parent = models.Parent.objects.get(id=id)
    except models.Parent.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    serializer = ParentSerializer(parent)
    return Response(serializer.data)

# creates a new parent, needs name, email, password, phone, role (2 for specialist & 3 for parent)


@api_view(['POST', ])
@csrf_exempt
def api_parent_create(request):

    parent = models.Parent()
    serializer = ParentSerializer(parent, data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# parent update, get parent ID and gets all of the parent's data including the fixed data and the data that needs to be changed
@api_view(['PUT', ])
@csrf_exempt
def api_parent_update(request, id):

    parent = models.Parent.objects.get(id=id)
    serializer = ParentSerializer(parent, data=request.data, partial=True)
    data = {}
    if serializer.is_valid():
        serializer.save()
        data["success"] = "Update Successful"
        return Response(data=data)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# specialist update, get specialist ID and gets all of the specialist's data including the fixed data and the data that needs to be changed
@api_view(['PUT', ])
@csrf_exempt
def api_specialist_update(request, id):

    specialist = models.Specialist.objects.get(id=id)
    serializer = SpecialistSerializer(
        specialist, data=request.data, partial=True)
    data = {}
    if serializer.is_valid():
        serializer.save()
        data["success"] = "Update Successful"
        return Response(data=data)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# Deletes a parent from database, needs parent ID, not needed
@api_view(['DELETE', ])
def api_parent_delete(request, id):

    parent = models.Parent.objects.get(id=id)
    operation = parent.delete()
    data = {}
    if operation:
        data["success"] = "Delete Successful"
    else:
        data["failure"] = "Delete Failed"
    return Response(data=data)


# shows specilist data, needs Specialist ID
@api_view(['GET', ])
def api_specialist_view(request, id):

    specialist = models.Specialist.objects.get(id=id)
    serializer = SpecialistSerializer(specialist)
    return Response(serializer.data)


# Uselessssss
@api_view(['GET', ])
def api_inquiry_view(request, id):

    inquiry = models.SingleInquiry.objects.get(id=id)
    serializer = InquirySerializer(inquiry)
    return Response(serializer.data)


@api_view(['GET', ])
def api_question_view(request):

    question = models.Question.objects.annotate(link_count=Count('RelatedAnswers')).filter(link_count=0).order_by('-id')
    serializer = QuestionSerializer(question, many=True)
    return Response(serializer.data)


@api_view(['POST', ])
def api_answer_create(request, id):

    answer = models.Answer()
    serializer = AnswerSerializer(answer, data=request.data, partial=True)
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# shows all of the empty slots, needs specialist ID.
@api_view(['GET', ])
def api_slot_view(request, id):

    slots = models.Slots.objects.filter(schedule_specialist=id, booked=0)
    serializer = SlotSerializer(slots, many=True)
    return Response(serializer.data)

# shows all of the empty slots, needs date in this format (ex. "YYYY-MM-DD") with request body ("daydate")
# returns the distinct id, satrt time and end time only
@api_view(['POST', ])
def api_slot_search(request):
    try:
        slots = models.Slots.objects.filter(slot_date=request.data["daydate"], booked=0).values("id", "slot_start_time", "slot_end_time").distinct()
       
    except models.Slots.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    
    return Response(slots, status=status.HTTP_200_OK)
    


# Adds new slots, from the parenting specialist app, needs prenting specialist Id, date of the slot, the day of the Slot written as string, start time, end time = start time + 1 hour
@api_view(['POST', ])
@csrf_exempt
def api_slot_create(request):

    slot = models.Slots()
    serializer = SlotSerializer(slot, data=request.data)

    if serializer.is_valid():
        serializer.save()

        return Response(serializer.data, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# Deletes a slot when the specialist removes an empty slot from his schedule, needs slot ID
@api_view(['DELETE', ])
def api_slot_delete(request, id):

    slot = models.Slots.objects.get(id=id)
    operation = slot.delete()
    data = {}
    if operation:
        data["success"] = "Delete Successful"
    else:
        data["failure"] = "Delete Failed"
    return Response(data=data)


#  updates slot data, mainly to change the status of the slot to booked (boolean) when a parent books it.
@api_view(['PUT', ])
@csrf_exempt
def api_slot_update(request, id):

    slot = models.Slots.objects.get(id=id)
    serializer = SlotSerializer(slot, data=request.data, partial=True)
    data = {}
    if serializer.is_valid():
        serializer.save()
        data["success"] = "Update Successful"
        return Response(data=data)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# Views all of the appointments of the parent, needs his ID
@api_view(['GET', ])
def api_parent_appointment_view(request, ids):
    try:
        slots = models.Slots.objects.filter(id__in=(models.VideoSession.objects.filter(parent_id=ids).values("video_slot")))
        serializer = SlotSerializer(slots, many=True)
    except models.Slots.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    
    return Response(serializer.data, status=status.HTTP_200_OK)


# Views all of the appointments of the specialist, needs his ID

@api_view(['GET', ])
def api_specialist_appointment_view(request, id):

    slots = models.Slots.objects.filter(schedule_specialist=id, booked=1)
    serializer = SlotSerializer(slots, many=True)
    return Response(serializer.data, status=status.HTTP_200_OK)


# deletes a certain appointment , needs its ID, and you should turn the slot.booked to 0 using the slot_update
@api_view(['DELETE', ])
def api_appointment_delete(request, id):
    # support this witht the session's id
    appointment = models.VideoSession.objects.get(id=id)
    operation = appointment.delete()
    data = {}
    if operation:
        data["success"] = "Delete Successful"
    else:
        data["failure"] = "Delete Failed"
    return Response(data=data)


# creates a new apointment, needs parent ID, slot ID

@api_view(['POST', ])
@csrf_exempt
def api_appointment_create(request):

    appointment = models.VideoSession()
    serializer = AppointmentSerializer(appointment, data=request.data)

    if serializer.is_valid():
        serializer.save()

        return Response(serializer.data, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# returns whether there exists a parent with this email or not
# returns 200_OK if this email is free and can be used
@api_view(['POST', ])
@csrf_exempt
def api_existing_parent_email(request):
    try:
        parent = models.Parent.objects.get(
            user_email=request.data["user_email"])
    # in case no specialist has this email, then return success
    except models.Parent.DoesNotExist:
        return Response(status=status.HTTP_200_OK)

    return Response(status=status.HTTP_404_NOT_FOUND)


# returns whether there exists a parent with this number or not
# return 200_OK if this phone is free and can be used
@api_view(['POST', ])
@csrf_exempt
def api_existing_parent_phone(request):
    try:
        parent = models.Parent.objects.get(
            user_phone=request.data["user_phone"])
    # in case no specialist has this email, then return success
    except models.Parent.DoesNotExist:
        return Response(status=status.HTTP_200_OK)

    return Response(status=status.HTTP_404_NOT_FOUND)


#########################################################################################
#                       Booking appointment algorithm                                   #
# 1-  view available slots based on a certain date ("using api_slot_serach")            #
# 2-  create appointment using parent_id and slot_id ("using api_appointment_create")   #
# 3-  change the slot "booked value" to 1 ("using api_slot_update")                     #
#########################################################################################


##############################################################################################################################
#                       Deleting appointment algorithm                                  
# 1-  view running appointment for this user ("using api_specialist_appointment_view  or  api_parentt_appointment_view")
# 2-  delete appointment using appointment_id ("using api_appointment_delete"), get the appointment_id from the previous step   
# 3-  change the slot "booked value" to 0 ("using api_slot_update"), get the slot_id from the appointment data                     
##############################################################################################################################