Return-Path: <SRS0=DASI=OS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43331C433EF
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 07:00:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02200611C0
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 07:00:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 02200611C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0d2qrmhVteob0itIQPhjrJG9fyQSy05MYguMdNXpj2M=; b=hSs9zEkqm11RP/l4dj/Y/gy/dC
	SX4QVtQc7FzBRnDJkOTPn4A2gXTAktyRqF/Qlvc58J9p/P/CTi4MUYYEaCiAPAMxBY2aXBHHVxwq1
	786l565QjlGW12YR1vPQVFab4Zvr0xa66WztP7kBEEGptal28qojaTKx5P/L1LGCyMf2ePnwxMrmb
	a4Oicr0tsoN+OuG5LI49ksiCPxAURRxx3pTo0aKCy3ZwzYLICnZKRI4EgsD9ndjF9L1MK2zfNZS3+
	F099il4/XfF0FsVxJFbXZX1Fr4vGQy8QjbAZsMwC3QMzrIbFnS2qd4KwtC8wiNKgnBUVkCzu4mKZz
	G/rWS6FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mV75v-005vws-S0; Tue, 28 Sep 2021 07:00:03 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mThaV-00DtQR-4o
 for ath11k@lists.infradead.org; Fri, 24 Sep 2021 09:33:48 +0000
Received: by mail-pl1-x630.google.com with SMTP id y5so3626658pll.3
 for <ath11k@lists.infradead.org>; Fri, 24 Sep 2021 02:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=arvKcy0oK1uFOhB3DROjhVP+WqafjpA1AZpd270wCvw=;
 b=i0IYMBS3HK/kkWs1+qkNMSEnDmcVOFC1MK0IGtBlrzmtBl9xVa2SncSipBP5YE9/rd
 vWjOX/Y8J4ZzHRN0wLDXSEa95Aqyul3nHr28v2F6Bv7S/fE2FbrIFQyc4FuDafhDKAD5
 ZCKycgKMz1YhqwBWsMdoXsn/0FTqpApY/WjgJYcESSb8hJ6xxtmg1e+y1l6Bs8sXhoxa
 0WwtjRMUnZq3MGDK4U+6jBsgEo1YpvVBH5/YHyfJAbLR2OuFvxjuWGEYbz1WLvV6Kn6O
 ZcEyiVF/KgqZDAooL6uDCKS7Vq2/1CX+rSVulKWZJgyUoQYBCbD+/nkPpA8DN4rvvB1Z
 t5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=arvKcy0oK1uFOhB3DROjhVP+WqafjpA1AZpd270wCvw=;
 b=JOwy/OkIago4tl6jwA5FVX/0Waf4OwCiQQpTk8JirWCYJjkXQd1czMdEc0ujrCyf+e
 Sg6VSASQ0pRy7FN7C3GrZ+RJmt7OfZOQsEJpO/HZe5Ua8OgrHqS2Vp3zH5gsVP2pb4yj
 x7PLbaJYVMFl5cPwWMOaJYFBnmqMbfajN0HBPJt1NdatFyVNyBJQVMCUrKbnAybxGraa
 5G8dJDZhXFewuc9ly/BX/89GqnlVM4bEwmv03kmo5vaR2SYUJGVFuPsNmRlmRXMdoDT6
 mgf5RGS8a67ZQ+VghEWMoIq1xUe/O5y2cu7Q4qtWeTOPc23goVUWIq76+psxtgxgpKdY
 4Jsg==
X-Gm-Message-State: AOAM533vbVDk7lDws55vXNZebsSNB4xt2X2QqqqLyJVE0Ytnvef8aH29
 86fszoYxA/Pv82CNZiMe/W9xomGmjtEtnyRGa17SIQFCYd2cUg==
X-Google-Smtp-Source: ABdhPJxtCbRhCeURlLN0FOqsy+WKL3sVedKtGsiZ/CK357GTgFZfiCcxWCqrVeFE/SRiJmX9nIa1AOdqdnGKvTITu0k=
X-Received: by 2002:a17:90b:4a88:: with SMTP id
 lp8mr1080883pjb.159.1632476025514; 
 Fri, 24 Sep 2021 02:33:45 -0700 (PDT)
MIME-Version: 1.0
References: <871r5p0x2u.fsf@codeaurora.org>
 <CAMZdPi8UJLvBFQd8-nf-iHAQh8cEuihq97PUFfZ7Q=rxRQoPsg@mail.gmail.com>
 <877df6tlnq.fsf@codeaurora.org>
In-Reply-To: <877df6tlnq.fsf@codeaurora.org>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Fri, 24 Sep 2021 11:43:55 +0200
Message-ID: <CAMZdPi8P7YZPhPir+WfS3cY_a7He1m2Pq2uqBhczPdEeoNRb0Q@mail.gmail.com>
Subject: Re: [regression] mhi: ath11k resume fails on some devices
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 ath11k@lists.infradead.org, 
 linux-wireless@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
 regressions@lists.linux.dev
Content-Type: multipart/mixed; boundary="0000000000009bbc5c05ccba717f"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_023347_311734_F2B146C4 
X-CRM114-Status: GOOD (  40.61  )
X-Mailman-Approved-At: Tue, 28 Sep 2021 00:00:03 -0700
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

--0000000000009bbc5c05ccba717f
Content-Type: text/plain; charset="UTF-8"

Hi Kalle,

On Fri, 24 Sept 2021 at 10:36, Kalle Valo <kvalo@codeaurora.org> wrote:
>
> Loic Poulain <loic.poulain@linaro.org> writes:
>
> > Hi Kalle,
> >
> > On Thu, 16 Sept 2021 at 10:00, Kalle Valo <kvalo@codeaurora.org> wrote:
> >>
> >> Hi Loic and Mani,
> >>
> >> I hate to be the bearer of bad news again :)
> >>
> >> I noticed already a while ago that commit 020d3b26c07a ("bus: mhi: Early
> >> MHI resume failure in non M3 state"), introduced in v5.13-rc1, broke
> >> ath11k resume on my NUC x86 testbox using QCA6390. Interestingly enough
> >> Dell XPS 13 9310 laptop (with QCA6390 as well) does not have this
> >> problem, I only see the problem on the NUC. I do not know what's causing
> >> this difference.
> >
> > I suppose the NUC is current PCI-Express power during suspend while
> > the laptop maintains PCIe/M2 power.
>
> Sorry, I'm not able to parse that sentence. Can you elaborate more?

Ouch, yes, I wanted to say that the NUC does not maintain the power of
PCI express during suspend (leading to PCI D3cold state), whereas the
laptop maintains the power of the M2 card... well, not sure now I see
your logs.

>
> >> At the moment I'm running my tests with commit 020d3b26c07a reverted and
> >> everything works without problems. Is there a simple way to fix this? Or
> >> maybe we should just revert the commit? Commit log and kernel logs from
> >> a failing case below.
> >
> > Do you have log of success case?
>
> A log from a successful case in the end of email, using v5.15-rc1 plus
> revert of commit 020d3b26c07abe27.
>
> > To me, the device loses power, that is why MHI resuming is failing.
> > Normally the device should be properly recovered/reinitialized. Before
> > that patch the power loss was simply not detected (or handled at
> > higher stack level).
>
> Currently in ath11k we always keep the firmware running when in suspend,
> this is a workaround due to problems between mac80211 and MHI stack.
> IIRC the problem was something related MHI creating struct device during
> resume or something like that.

Could you give a try with the attached patch? It should solve your
issue without breaking modem support.

Regards,
Loic

--0000000000009bbc5c05ccba717f
Content-Type: application/x-patch; 
	name="0001-bus-mhi-Add-support-for-forced-resume.patch"
Content-Disposition: attachment; 
	filename="0001-bus-mhi-Add-support-for-forced-resume.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kty6egb60>
X-Attachment-Id: f_kty6egb60

RnJvbSA2OTdjZjkwMTU1ZDc4MjI1ZDk2NzgzNmRjZGIyMjkxNDY4YzNlNjBkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBMb2ljIFBvdWxhaW4gPGxvaWMucG91bGFpbkBsaW5hcm8ub3Jn
PgpEYXRlOiBGcmksIDI0IFNlcCAyMDIxIDExOjE0OjAzICswMjAwClN1YmplY3Q6IFtQQVRDSF0g
YnVzOiBtaGk6IEFkZCBzdXBwb3J0IGZvciBmb3JjZWQgcmVzdW1lCgpGb3Igd2hhdGV2ZXIgcmVh
c29uLCBzb21lIGRldmljZXMgbGlrZSBhdGgxMWsgYXJlIG5vdCBpbiBNMyBzdGF0ZSB3aGVuCnJl
c3VtaW5nLCBidXQgc3RpbGwgZnVuY3Rpb25hbC4gVGhlIG1oaV9wbV9yZXN1bWUgc2hvdWxkIHRo
ZW4gbm90IGZhaWwKaW4gdGhhdCBjYXNlLCBhbmQgbGV0IHRoZSBoaWdoZXIgbGV2ZWwgZGV2aWNl
IHNwZWNpZmljIHN0YWNrIGNvbnRpbnVlCnJlc3VtaW5nIHByb2Nlc3MuCgpBZGQgYSBuZXcgcGFy
YW1ldGVyIHRvIG1oaV9wbV9yZXN1bWUsIHRvIHRyeSByZXN1bWluZywgd2hhdGV2ZXIgdGhlCmN1
cnJlbnQgTUhJIHN0YXRlIGlzLiBUaGlzIGZpeGVzIGEgcmVncmVzc2lvbiB3aXRoIG5vbiBmdW5j
dGlvbmFsCmF0aDExayBXaUZpIGFmdGVyIHN1c3BlbmQvcmVzdW1lIGN5Y2xlIG9uIHNvbWUgbWFj
aGluZXMuCgpGaXhlczogMDIwZDNiMjZjMDdhICgiYnVzOiBtaGk6IEVhcmx5IE1ISSByZXN1bWUg
ZmFpbHVyZSBpbiBub24gTTMgc3RhdGUiKQpTaWduZWQtb2ZmLWJ5OiBMb2ljIFBvdWxhaW4gPGxv
aWMucG91bGFpbkBsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvYnVzL21oaS9jb3JlL3BtLmMgICAg
ICAgICAgICAgfCAxMCArKysrKysrLS0tCiBkcml2ZXJzL2J1cy9taGkvcGNpX2dlbmVyaWMuYyAg
ICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvbWhpLmMgfCAg
MiArLQogaW5jbHVkZS9saW51eC9taGkuaCAgICAgICAgICAgICAgICAgICB8ICAzICsrLQogNCBm
aWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvYnVzL21oaS9jb3JlL3BtLmMgYi9kcml2ZXJzL2J1cy9taGkvY29yZS9wbS5j
CmluZGV4IGJiZjZjZDAuLmVmMGU2OTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYnVzL21oaS9jb3Jl
L3BtLmMKKysrIGIvZHJpdmVycy9idXMvbWhpL2NvcmUvcG0uYwpAQCAtODgxLDcgKzg4MSw3IEBA
IGludCBtaGlfcG1fc3VzcGVuZChzdHJ1Y3QgbWhpX2NvbnRyb2xsZXIgKm1oaV9jbnRybCkKIH0K
IEVYUE9SVF9TWU1CT0xfR1BMKG1oaV9wbV9zdXNwZW5kKTsKIAotaW50IG1oaV9wbV9yZXN1bWUo
c3RydWN0IG1oaV9jb250cm9sbGVyICptaGlfY250cmwpCitpbnQgbWhpX3BtX3Jlc3VtZShzdHJ1
Y3QgbWhpX2NvbnRyb2xsZXIgKm1oaV9jbnRybCwgYm9vbCBmb3JjZSkKIHsKIAlzdHJ1Y3QgbWhp
X2NoYW4gKml0ciwgKnRtcDsKIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmbWhpX2NudHJsLT5taGlf
ZGV2LT5kZXY7CkBAIC04OTgsOCArODk4LDEyIEBAIGludCBtaGlfcG1fcmVzdW1lKHN0cnVjdCBt
aGlfY29udHJvbGxlciAqbWhpX2NudHJsKQogCWlmIChNSElfUE1fSU5fRVJST1JfU1RBVEUobWhp
X2NudHJsLT5wbV9zdGF0ZSkpCiAJCXJldHVybiAtRUlPOwogCi0JaWYgKG1oaV9nZXRfbWhpX3N0
YXRlKG1oaV9jbnRybCkgIT0gTUhJX1NUQVRFX00zKQotCQlyZXR1cm4gLUVJTlZBTDsKKwlpZiAo
bWhpX2dldF9taGlfc3RhdGUobWhpX2NudHJsKSAhPSBNSElfU1RBVEVfTTMpIHsKKwkJZGV2X3dh
cm4oZGV2LCAiUmVzdW1pbmcgZnJvbSBub24gTTMgc3RhdGUgKCVzKVxuIiwKKwkJCSBUT19NSElf
U1RBVEVfU1RSKG1oaV9nZXRfbWhpX3N0YXRlKG1oaV9jbnRybCkpKTsKKwkJaWYgKCFmb3JjZSkK
KwkJCXJldHVybiAtRUlOVkFMOworCX0KIAogCS8qIE5vdGlmeSBjbGllbnRzIGFib3V0IGV4aXRp
bmcgTFBNICovCiAJbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKGl0ciwgdG1wLCAmbWhpX2NudHJs
LT5scG1fY2hhbnMsIG5vZGUpIHsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvYnVzL21oaS9wY2lfZ2Vu
ZXJpYy5jIGIvZHJpdmVycy9idXMvbWhpL3BjaV9nZW5lcmljLmMKaW5kZXggYjMzYjlkNy4uZGJh
NGI3ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9idXMvbWhpL3BjaV9nZW5lcmljLmMKKysrIGIvZHJp
dmVycy9idXMvbWhpL3BjaV9nZW5lcmljLmMKQEAgLTkyNCw3ICs5MjQsNyBAQCBzdGF0aWMgaW50
IF9fbWF5YmVfdW51c2VkIG1oaV9wY2lfcnVudGltZV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2
KQogCQlyZXR1cm4gMDsgLyogTm90aGluZyB0byBkbyBhdCBNSEkgbGV2ZWwgKi8KIAogCS8qIEV4
aXQgTTMsIHRyYW5zaXRpb24gdG8gTTAgc3RhdGUgKi8KLQllcnIgPSBtaGlfcG1fcmVzdW1lKG1o
aV9jbnRybCk7CisJZXJyID0gbWhpX3BtX3Jlc3VtZShtaGlfY250cmwsIGZhbHNlKTsKIAlpZiAo
ZXJyKSB7CiAJCWRldl9lcnIoJnBkZXYtPmRldiwgImZhaWxlZCB0byByZXN1bWUgZGV2aWNlOiAl
ZFxuIiwgZXJyKTsKIAkJZ290byBlcnJfcmVjb3Zlcnk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL25l
dC93aXJlbGVzcy9hdGgvYXRoMTFrL21oaS5jIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0
aDExay9taGkuYwppbmRleCA3NWNjMmQ4Li5mOTEzNDM5IDEwMDY0NAotLS0gYS9kcml2ZXJzL25l
dC93aXJlbGVzcy9hdGgvYXRoMTFrL21oaS5jCisrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0
aC9hdGgxMWsvbWhpLmMKQEAgLTUzMiw3ICs1MzIsNyBAQCBzdGF0aWMgaW50IGF0aDExa19taGlf
c2V0X3N0YXRlKHN0cnVjdCBhdGgxMWtfcGNpICphYl9wY2ksCiAJCXJldCA9IG1oaV9wbV9zdXNw
ZW5kKGFiX3BjaS0+bWhpX2N0cmwpOwogCQlicmVhazsKIAljYXNlIEFUSDExS19NSElfUkVTVU1F
OgotCQlyZXQgPSBtaGlfcG1fcmVzdW1lKGFiX3BjaS0+bWhpX2N0cmwpOworCQlyZXQgPSBtaGlf
cG1fcmVzdW1lKGFiX3BjaS0+bWhpX2N0cmwsIHRydWUpOwogCQlicmVhazsKIAljYXNlIEFUSDEx
S19NSElfVFJJR0dFUl9SRERNOgogCQlyZXQgPSBtaGlfZm9yY2VfcmRkbV9tb2RlKGFiX3BjaS0+
bWhpX2N0cmwpOwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9taGkuaCBiL2luY2x1ZGUvbGlu
dXgvbWhpLmgKaW5kZXggYzQ5M2E4MC4uZjczYjI3MCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51
eC9taGkuaAorKysgYi9pbmNsdWRlL2xpbnV4L21oaS5oCkBAIC02NTgsOCArNjU4LDkgQEAgaW50
IG1oaV9wbV9zdXNwZW5kKHN0cnVjdCBtaGlfY29udHJvbGxlciAqbWhpX2NudHJsKTsKIC8qKgog
ICogbWhpX3BtX3Jlc3VtZSAtIFJlc3VtZSBNSEkgZnJvbSBzdXNwZW5kZWQgc3RhdGUKICAqIEBt
aGlfY250cmw6IE1ISSBjb250cm9sbGVyCisgKiBAZm9yY2U6IEZvcmNlIHJlc3VtaW5nIHRvIE0w
LCB3aGF0ZXZlciB0aGUgY3VycmVudCBzdGF0ZQogICovCi1pbnQgbWhpX3BtX3Jlc3VtZShzdHJ1
Y3QgbWhpX2NvbnRyb2xsZXIgKm1oaV9jbnRybCk7CitpbnQgbWhpX3BtX3Jlc3VtZShzdHJ1Y3Qg
bWhpX2NvbnRyb2xsZXIgKm1oaV9jbnRybCwgYm9vbCBmb3JjZSk7CiAKIC8qKgogICogbWhpX2Rv
d25sb2FkX3JkZG1faW1hZ2UgLSBEb3dubG9hZCByYW1kdW1wIGltYWdlIGZyb20gZGV2aWNlIGZv
cgotLSAKMi43LjQKCg==
--0000000000009bbc5c05ccba717f
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--0000000000009bbc5c05ccba717f--

