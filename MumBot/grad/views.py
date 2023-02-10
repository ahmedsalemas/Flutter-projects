from django.shortcuts import render
from django.urls import include, reverse
from django.http import HttpResponse, HttpResponseRedirect, JsonResponse
from itertools import chain
from django.views.decorators.csrf import csrf_exempt
from .models import VideoSession, Parent, Specialist, Admin, Slots, Question
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from datetime import datetime
import hashlib


def index(request):
    if not request.user.is_authenticated:
        messages.error(request, "You are not authorized to view this page!")
        return HttpResponseRedirect(reverse("login"))
    else:
        return render(request, "grad/index.html")


def reset_password(request):
    if not request.user.is_authenticated:
        return HttpResponseRedirect(reverse("login"))
    else:
        return render(request, "grad/reset-password.html")


def appointments(request):
    if not request.user.is_authenticated:
        messages.error(request, "You are not authorized to view this page!")
        return HttpResponseRedirect(reverse("login"))
    else:
        return render(request, "grad/appointments.html", {
            "appointments": VideoSession.objects.all(),
        })


def question(request):
    if not request.user.is_authenticated:
        #messages.error(request, "You are not authorized to view this page!")
        return HttpResponseRedirect(reverse("login"))
    else:
        return render(request, "grad/question.html")


def viewuser(request):
    if not request.user.is_authenticated:
        messages.error(request, "You are not authorized to view this page!")
        return HttpResponseRedirect(reverse("login"))
    else:
        return render(request, "grad/viewuser.html", {
            "all_users": chain(Parent.objects.all(), Specialist.objects.all()),
        })


def edituser(request, id, user_role):
    if not request.user.is_authenticated:
        messages.error(request, "You are not authorized to view this page!")
        return HttpResponseRedirect(reverse("login"))
    else:
        if user_role == 2:
            return render(request, "grad/edituser.html", {
                "user": Specialist.objects.get(pk=id)
            })
        elif user_role == 3:
            return render(request, "grad/edituser.html", {
                "user": Parent.objects.get(pk=id)
            })
        else:
            pass


def updateuser(request, id, user_role):
    if not request.user.is_authenticated:
        messages.error(request, "You are not authorized to view this page!")
        return HttpResponseRedirect(reverse("login"))
    else:
        if request.method == "POST":
            if user_role == 2:
                user = Specialist.objects.get(pk=id)
                user.user_name = request.POST["user_name"]
                user.user_email = request.POST["user_email"]
                user.user_phone = request.POST["user_phone"]
                user.specialist_brief = request.POST["user_brief"]
                user.save()
            elif user_role == 3:
                user = Parent.objects.get(pk=id)
                user.user_name = request.POST["user_name"]
                user.user_email = request.POST["user_email"]
                user.user_phone = request.POST["user_phone"]
                user.save()
            return HttpResponseRedirect(reverse("viewuser"))


def deleteuser(request, id, user_role):
    if not request.user.is_authenticated:
        messages.error(request, "You are not authorized to view this page!")
        return HttpResponseRedirect(reverse("login"))
    else:
        if user_role == 2:
            return render(request, "grad/deleteuser.html", {
                "user": Specialist.objects.get(pk=id)
            })
        elif user_role == 3:
            return render(request, "grad/deleteuser.html", {
                "user": Parent.objects.get(pk=id)
            })
        else:
            pass


def confirmdeleteuser(request, id, user_role):
    if not request.user.is_authenticated:
        messages.error(request, "You are not authorized to view this page!")
        return HttpResponseRedirect(reverse("login"))
    else:
        if request.method == "POST":
            if user_role == 2:
                user = Specialist.objects.get(pk=id)
                user.delete()
            elif user_role == 3:
                user = Parent.objects.get(pk=id)
                user.delete()
            return HttpResponseRedirect(reverse("viewuser"))


def adduser(request):
    if not request.user.is_authenticated:
        messages.error(request, "You are not authorized to view this page!")
        return HttpResponseRedirect(reverse("login"))
    else:
        return render(request, "grad/adduser.html")


def addusers(request):
    if not request.user.is_authenticated:
        messages.error(request, "You are not authorized to view this page!")
        return HttpResponseRedirect(reverse("login"))
    else:
        if request.method == "POST":
            # in case no user type was selected
            if request.POST["user_type"] == "0":
                messages.error(request, "Please choose a user Type")
                return HttpResponseRedirect(reverse("adduser"))

            if request.POST["user_type"] == "2":
                # Checks if this email was previously used
                user_email_validator = Specialist.objects.filter(
                    user_email=request.POST["user_email"]).first()
                if user_email_validator is not None:
                    messages.error(request, "This email was previously used!")
                    return HttpResponseRedirect(reverse("adduser"))

                # Checks if this number was previously used
                user_phone_validator = Specialist.objects.filter(
                    user_phone=request.POST["user_phone"]).first()

                if user_phone_validator is not None:
                    messages.error(
                        request, "This phone number was previously used!")
                    return HttpResponseRedirect(reverse("adduser"))

                if request.POST["user_pass1"] != request.POST["user_pass2"]:
                    messages.error(
                        request, "The two passwords don't match!")
                    return HttpResponseRedirect(reverse("adduser"))

                # Creates a new user
                user = Specialist(user_role=2, user_name=request.POST["user_name"], user_email=request.POST["user_email"], user_phone=request.POST[
                    "user_phone"], user_password=hashlib.md5(request.POST["user_pass1"].encode()).hexdigest(), specialist_brief=request.POST["user_brief"])
                user.save()

            elif request.POST["user_type"] == "3":
                # Checks if this email was previously used
                user_email_validator = Parent.objects.filter(
                    user_email=request.POST["user_email"]).first()
                if user_email_validator is not None:
                    messages.error(request, "This email was previously used!")
                    return HttpResponseRedirect(reverse("adduser"))

                # Checks if this number was previously used
                user_phone_validator = Parent.objects.filter(
                    user_phone=request.POST["user_phone"]).first()

                if user_phone_validator is not None:
                    messages.error(
                        request, "This phone number was previously used!")
                    return HttpResponseRedirect(reverse("adduser"))

                if request.POST["user_pass1"] != request.POST["user_pass2"]:
                    messages.error(
                        request, "The two passwords don't match!")
                    return HttpResponseRedirect(reverse("adduser"))

                user = Parent(user_role=3, user_name=request.POST["user_name"], user_email=request.POST["user_email"],
                              user_phone=request.POST["user_phone"], user_password=hashlib.md5(request.POST["user_pass1"].encode()).hexdigest())
                user.save()

            messages.success(request, "User added successfuly")
            return HttpResponseRedirect(reverse("viewuser"))


def login_view(request):
    if request.method == "POST":
        username = request.POST["username"]
        password = request.POST["password"]
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return HttpResponseRedirect(reverse("index"))
        else:
            return render(request, "grad/login.html", {
                "message": "Invalid credentials"
            })
    return render(request, "grad/login.html")


def logout_view(request):
    if not request.user.is_authenticated:
        messages.error(request, "You are not authorized to view this page!")
        return HttpResponseRedirect(reverse("login"))
    else:
        logout(request)
        return render(request, "grad/login.html", {
            "message": "Logged out."
        })


def editappointment(request, id):
    if not request.user.is_authenticated:
        messages.error(request, "You are not authorized to view this page!")
        return HttpResponseRedirect(reverse("login"))
    else:
        return render(request, "grad/editappointment.html", {
            "appointment": VideoSession.objects.get(pk=id),
            "newdate": VideoSession.objects.get(pk=id).video_slot.slot_date.strftime("%Y-%m-%d"),
            "newstarttime": VideoSession.objects.get(pk=id).video_slot.slot_start_time,
            "newendtime": VideoSession.objects.get(pk=id).video_slot.slot_end_time,
            "all_slots": Slots.objects.filter(slot_date=VideoSession.objects.get(pk=id).video_slot.slot_date, booked=0).values("slot_start_time", "slot_end_time").distinct(),
        })


def editappointmentconfirmation(request, id):
    if not request.user.is_authenticated:
        messages.error(request, "You are not authorized to view this page!")
        return HttpResponseRedirect(reverse("login"))
    else:
        if request.method == "POST":
            appointment = VideoSession.objects.get(pk=id)
            if appointment.video_slot.slot_date.strftime("%Y-%m-%d") == request.POST["date"] and appointment.video_slot.slot_start_time.strftime("%H:%M") == request.POST["time"]:
                messages.error(request, "No change was made!")
                return HttpResponseRedirect(reverse("editappointment", kwargs={'id': appointment.id}))
            else:
                oldslot = Slots.objects.get(slot_date=appointment.video_slot.slot_date, slot_start_time=appointment.video_slot.slot_start_time,
                                            schedule_specialist=appointment.video_slot.schedule_specialist, booked=1)
                oldslot.booked = 0
                newslot = Slots.objects.filter(
                    slot_date=request.POST["date"], slot_start_time=request.POST["time"], booked=0).first()
                newslot.booked = 1
                oldslot.save()
                newslot.save()
                appointment.video_slot = newslot
                appointment.save()
                return HttpResponseRedirect(reverse("appointments"))


@csrf_exempt
def getallslotswithdate(request):
    if not request.user.is_authenticated:
        messages.error(request, "You are not authorized to view this page!")
        return HttpResponseRedirect(reverse("login"))
    else:
        if request.method == "POST":
            day_date = request.POST['daydate']
            try:
                times = Slots.objects.filter(slot_date=day_date, booked=0).values(
                    "slot_start_time", "slot_end_time").distinct()
            except Exception:
                data['error_message'] = 'An error occurred.'
                return JsonResponse(data)
            return JsonResponse(list(times.values('slot_start_time', 'slot_end_time')), safe=False)


def addquestion(request):
    if not request.user.is_authenticated:
        messages.error(request, "You are not authorized to view this page!")
        return HttpResponseRedirect(reverse("login"))
    else:
        if request.method == "POST":
            if request.user.is_authenticated:
                question = Question(
                    question_body=request.POST['questionbody'], question_tags=request.POST['questiontags'])
                question.save()
                messages.success(request, "Question was added successfuly!")
                return HttpResponseRedirect(reverse("question"))
            else:
                return HttpResponseRedirect(reverse("login"))
