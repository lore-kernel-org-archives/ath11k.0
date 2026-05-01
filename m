Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CFAFF8864
	for <ath11k@archiver.kernel.org>; Fri,  1 May 2026 07:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tGtVcTIpMWEwpucmYm7Gx7tK/7UnKyIDFZfgCJLjmmw=; b=VoRAOwlmNS+pMsb/19vYUgExrr
	w8EXPOL8CrNqRt46ErIP5FuMpPaF2F0yQjc1bCIN9+9Q79eod9dkClfFKcSY40jpmZbBEQzJqFlqX
	6S/fnif2qJK+o7ZLN8NmIXGKM+kwqi33HTs2Z3Crspi2NXSZDqJBsMapQ/xc64DcpUeMR6SoxGcFR
	egec6fBWln11I4gZ2rd2ka8bpY9HtzYUWAQn04WmteU3fHlICHG20l0b8g1gAcFYMIzJZHu9tQkCA
	uZIhevhRCb7TNbd5f9Hb3N82vYYYLbvEoT2oHDrWdWJW038Ww+3sH6VPTZNQa0W9MazBwEwTwYQR2
	SxXSTX0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIhzH-00000006S9G-1wck;
	Fri, 01 May 2026 07:08:35 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIhzF-00000006S8u-0FFo
	for ath11k@lists.infradead.org;
	Fri, 01 May 2026 07:08:34 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-7d4c383f2fcso1536851a34.0
        for <ath11k@lists.infradead.org>; Fri, 01 May 2026 00:08:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777619312; cv=none;
        d=google.com; s=arc-20240605;
        b=i7H44cI2csJNovimy3OrrIJxcM+Rok58saemwtm3NPGaLoA7UNQgAa4c0avlTsa9Bf
         9IIRjcKrBXCggznfbE+tzcPHld2dRvNHLF6olqEjDimPY1O7qeOm0l3JzrpTnNgiDmgz
         jjnK6BEWOwU8PSLQEPGTUQHlZBZcvhb3QYpFCrQgis5Q2jgNWT9mwCD3HuA2UwADGoto
         KN87532Jn/MxmwmPTJuNVD2a70BJxOxkh/njPbS4wnf/rIQGCRITERpfjxSPVBU2/tJo
         1Z37Ks+2ZnIJQOjHLc9rJxbX8I5Ea9E2X69xYLCf2cUvFjajmlGVk98sv9oToX/3J2Yr
         /p1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tGtVcTIpMWEwpucmYm7Gx7tK/7UnKyIDFZfgCJLjmmw=;
        fh=Pqk5SFeTwzEixc/piCiHMorGqBN6OZ14Y+s+lsD4Hhw=;
        b=huuF2qLLU43VyDFIMBuTwN81pNifyXBHjYBcJGZDpt8txRqhV48PSmj0J2zCDBcoWO
         kssGfzZZgm1dvXL0qJGDeyPTVhSBD+my6c9rmgCOJwEBqcK5xz53b2nc6kjyfZ/w95Vi
         0UPSdRqWXQUl1v/qM442hT0OsuxgeGbedmh0EovtlGpNVhfo9nNqkqp6cI4PypZnP8fw
         oXNMJ6K+5udmwPC65V/3JYSY7gUxfkovQhPbTgvnIF/LKA+N0Wo74Pe6/oEnSz8XTlZO
         Pr0nsP0Hjj7+9T63hcHbTxi+1USJBu9B+Bl9vy5WzTTyNnuaUdc1BaaJiuueh0Zl0tF3
         Svxw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777619312; x=1778224112; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tGtVcTIpMWEwpucmYm7Gx7tK/7UnKyIDFZfgCJLjmmw=;
        b=sc6Qlvj8Yno+2huRGP8P2aqUu7b7fbbsTpyJhD8vpRQz2HhgFYNiFOPAs38ZXqZ9Qr
         5FAN2dUy1PePZRUx0KXvLFJqJerBXBwRdJnlqEmwh1urE3G/Y1amUPQlt0dGI4vzCi/8
         GrrNHxu211sLEcfDfdPbWtb+UqNY63sPlDfmbHJKxtTJLKVx2td9mHaXXaCTCaIjuZa7
         Ci0hF3++garT0Uz0C0OhP22Fji4u59bpqN9RnmZOI/I1/gorRMe2wxv29AwytGsDUgqW
         +r0lCAjR/tnYPlkrLjXP2XWACfHxRDC8vjsZEk1o6RNnF8ilUqYLxacavEj/xFlDVXuu
         5u4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777619312; x=1778224112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tGtVcTIpMWEwpucmYm7Gx7tK/7UnKyIDFZfgCJLjmmw=;
        b=q/PgDgyXj0H3Jm0wBW5fGlv/sV5/cKtpkgAsimJ9ni1kwkqwJ/atLodQIHgG1oTOaO
         d+WHn7aQbD44/5gQy0QmKAk1WkxeQEo2lzxE1aMyshENAxZiDsUKVD/2CC1nINbDaF86
         BMdVaFtZBisHZbzrxC3oOTgK1HBMZVydtvAdIeB79ZScZTQheA6QZETQg861c0f4u2ZR
         tYXrphzlRF3vvwKyX1yfDjMPluHxaLIvLycrbeo/u3ZTTgWjm1AULx2ql0T4hG+dmcIU
         RLKW5BZieNuODhpXjd4oNF5IhJ575FEacHIGWxSabX6C4f0zaVtpPp6TEHZsrV9andua
         uo5g==
X-Forwarded-Encrypted: i=1; AFNElJ8QoFIOcwffERUJjuAGvdxPZdI1Zg/UH8R/c6ujXYIZz6tWyLzFdVDfN7UXLuqbk3VqmGCRmzs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8ecOTEFo0XlIj3Yf48IanOVw+7uDy+Q/9Zv90WpPtgFbDzRdP
	HLQPNXxtLGQAE4OdY+vvDmgYraFsnIeOVK3W2StfQb0Gde5AP3F48asM8+xb3BTFhgWlBT7jiWN
	paUnteNqOJtym3QaWyne6M7IWRTxG/uk=
X-Gm-Gg: AeBDieseJ29Fv4EiYCjC9a1Xs5v0x9zfI01Q7Wry0u8aiAGZIxE+SpDBrOqXIJNwOPJ
	jKT4B+QvSP/9JbIxOSXJEQeY/QlSrV8148OJx7A5gR84qwH8DHXmIQtgfKnqvieHpWOQT0HZFeK
	wm2Kc/1aCYOUHAMH/0DNxhxqImFrMOn5fi67WoglZ454IzemPgN8xzqoP0CBHSpQhv5Xs6z93ZN
	5MXsdYtjC4/914HZsGArMizIk8DhVTaMHEOZupLCLPCOfsYKARls8QvdNPZ/oolVwQmtADk88VW
	3mGoZIyQZSfEDEOGeRaJO8CoEx7THZ9tutm5Bd+S1sSMDJg=
X-Received: by 2002:a05:6830:2650:b0:7dc:c926:4f87 with SMTP id
 46e09a7af769-7debdde82d2mr3374302a34.16.1777619311744; Fri, 01 May 2026
 00:08:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260330-p14s-pm-quirk-v2-1-ef18ce07996b@gmail.com>
 <082b3d13-6fb1-4041-a187-fddec3b013e4@oss.qualcomm.com> <CAOPSVF0VHR4BQsmfWFeFnANsQYBw-x7fHxH2JFNO=oWjgeS66Q@mail.gmail.com>
 <ba4d194b-6d31-4d8a-a6a6-da116f9f56ac@oss.qualcomm.com>
In-Reply-To: <ba4d194b-6d31-4d8a-a6a6-da116f9f56ac@oss.qualcomm.com>
From: Kyle Farnung <kfarnung@gmail.com>
Date: Fri, 1 May 2026 00:08:19 -0700
X-Gm-Features: AVHnY4ICkNhQPdf3q3XMOiB8IYKOepiuhb0qIQbdpuz7l3PNcE3h0yiAcsn0i0o
Message-ID: <CAOPSVF04q6uvVdq8GTRLHBrVMdpt9=o9wVcFMc6f-yhmSBcZqQ@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: ath11k: apply existing PM quirk to ThinkPad P14s
 Gen 5 AMD
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Baochen Qiang <quic_bqiang@quicinc.com>, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_000833_116135_4B257EB7 
X-CRM114-Status: GOOD (  36.54  )
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

On Mon, Apr 13, 2026 at 11:43=E2=80=AFPM Baochen Qiang
<baochen.qiang@oss.qualcomm.com> wrote:
>
>
>
> On 4/1/2026 11:48 AM, Kyle Farnung wrote:
> > On Tue, Mar 31, 2026 at 7:08=E2=80=AFPM Baochen Qiang
> > <baochen.qiang@oss.qualcomm.com> wrote:
> >>
> >>
> >>
> >> On 3/31/2026 2:32 PM, Kyle Farnung via B4 Relay wrote:
> >>> From: Kyle Farnung <kfarnung@gmail.com>
> >>>
> >>> Some ThinkPad P14s Gen 5 AMD systems experience suspend/resume
> >>> reliability issues similar to those reported in [1]. These platforms
> >>
> >> how similar it is? can you describe the issue in details?
> >
> > The issue is that intermittently after suspend my WiFi adapter connects
> > successfully for a few minutes and then drops. It will then keep trying=
 to
> > reconnect in a loop but never succeed. A reboot will fix it, but eventu=
ally
> > I found that reloading the module also resolves the issue
> > (modprobe -r ath11k_pci && modprobe ath11k_pci). Based on some searchin=
g, I
> > did try adding "ath11k_pci.disable_idle_ps=3D1" to my kernel arguments.=
 At
> > first it looked like maybe it worked, but then I hit the same problem
> > again. At that point I decided to try building a custom module with the
> > ATH11K_PM_WOW override and so far I'm two days and 10 suspends in witho=
ut
> > issue.
> >
> > Looking through kernel logs, the issue appears to have started with ker=
nel
> > version 6.17.4. It looks like my Fedora install jumped from 6.16.10 to
> > 6.17.4 on October 22, 2025 and I started seeing the issue two days late=
r.
> >
> > Here are the logs from the most recent occurrence (filtered for brevity=
):
> >
> > Mar 29 15:26:24 kjfp14sg5 kernel: PM: suspend exit
> > Mar 29 15:26:24 kjfp14sg5 kernel: ath11k_pci 0000:02:00.0: chip_id
> > 0x12 chip_family 0xb board_id 0xff soc_id 0x400c1211
> > Mar 29 15:26:24 kjfp14sg5 kernel: ath11k_pci 0000:02:00.0: fw_version
> > 0x11088c35 fw_build_timestamp 2024-04-17 08:34 fw_build_id
> > WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
> > Mar 29 15:26:30 kjfp14sg5 wpa_supplicant[2373]: wlp2s0:
> > CTRL-EVENT-REGDOM-CHANGE init=3DDRIVER type=3DCOUNTRY alpha2=3DUS
> > Mar 29 15:26:30 kjfp14sg5 wpa_supplicant[2373]: wlp2s0:
> > CTRL-EVENT-REGDOM-CHANGE init=3DDRIVER type=3DCOUNTRY alpha2=3DUS
> > Mar 29 15:26:30 kjfp14sg5 wpa_supplicant[2373]: wlp2s0:
> > CTRL-EVENT-REGDOM-CHANGE init=3DDRIVER type=3DCOUNTRY alpha2=3DUS
> > Mar 29 15:26:35 kjfp14sg5 wpa_supplicant[2373]: wlp2s0:
> > CTRL-EVENT-CONNECTED - Connection to 68:d7:9a:2a:94:f8 completed [id=3D=
0
> > id_str=3D]
> > Mar 29 15:26:49 kjfp14sg5 wpa_supplicant[2373]: wlp2s0: CTRL-EVENT-BEAC=
ON-LOSS
>
> this is the reason to your disconnection
>
> > Mar 29 15:26:55 kjfp14sg5 kernel: ath11k_pci 0000:02:00.0: failed to
> > flush transmit queue, data pkts pending 9
> > Mar 29 15:26:55 kjfp14sg5 wpa_supplicant[2373]: wlp2s0:
> > CTRL-EVENT-DISCONNECTED bssid=3D68:d7:9a:2a:94:f8 reason=3D4
> > locally_generated=3D1
> > Mar 29 15:27:00 kjfp14sg5 wpa_supplicant[2373]: wlp2s0:
> > CTRL-EVENT-DISCONNECTED bssid=3D80:2a:a8:98:26:3e reason=3D6
> > Mar 29 15:27:05 kjfp14sg5 wpa_supplicant[2373]: wlp2s0:
> > CTRL-EVENT-DISCONNECTED bssid=3D74:ac:b9:df:54:36 reason=3D6
> > Mar 29 15:27:09 kjfp14sg5 wpa_supplicant[2373]: wlp2s0:
> > CTRL-EVENT-DISCONNECTED bssid=3D68:d7:9a:2a:94:f8 reason=3D2
> > Mar 29 15:27:09 kjfp14sg5 wpa_supplicant[2373]: wlp2s0:
> > CTRL-EVENT-SSID-TEMP-DISABLED id=3D0 ssid=3D"Batman" auth_failures=3D1
> > duration=3D10 reason=3DCONN_FAILED
>
> and the bssid is disabled so association to this AP won't happen in a per=
iod.
>
> Anyway, although it works, using the PM quirk seems not the right fix. As=
 you mentioned it
> seems like a regression starting to show in 6.17.4, can you do regression=
 test to locate
> the issue commit?

It took a bit of trial and error, but I'm reasonably confident that [3] is
the culprit. The issue is pretty sporadic, but I've been able to reproduce
it twice in ~50 sleep/wake cycles on that commit, while the immediate
ancestor has been clean for 17 cycles so far. I'll continue testing and
report back.

The change looks suspicious as it modifies a code path that runs on every
sleep/wake cycle, and the failure appears to be some sort of corrupted
firmware state. In a couple of cases the WiFi firmware crashed outright
(MHI_CB_EE_RDDM) while the issue was occurring.

[3] 79266fd78df1 ("wifi: ath11k: HAL SRNG: don't deinitialize and
re-initialize again")

>
> >
> >>
> >>> were not previously included in the ath11k PM quirk table.
> >>>
> >>> Add DMI matches for product IDs 21ME and 21MF to apply the existing
> >>> ATH11K_PM_WOW override, improving suspend/resume behavior on these
> >>> systems.
> >>>
> >>> Tested on a ThinkPad P14s Gen 5 AMD (21ME) running 6.19.9.
> >>>
> >>> [1] https://bugzilla.kernel.org/show_bug.cgi?id=3D219196
> >>> [2] https://pcsupport.lenovo.com/us/en/products/laptops-and-netbooks/=
thinkpad-p-series-laptops/thinkpad-p14s-gen-5-type-21me-21mf/
> >>>
> >>> Fixes: ce8669a27016 ("wifi: ath11k: determine PM policy based on mach=
ine model")
> >>> Cc: stable@vger.kernel.org
> >>> Signed-off-by: Kyle Farnung <kfarnung@gmail.com>
> >>> ---
> >>> Changes in v2:
> >>> - Fix missing mailing list recipients (linux-wireless, ath11k, linux-=
kernel)
> >>> - Link to v1: https://lore.kernel.org/r/20260330-p14s-pm-quirk-v1-1-c=
f2fa39cc2d5@gmail.com
> >>> ---
> >>>  drivers/net/wireless/ath/ath11k/core.c | 14 ++++++++++++++
> >>>  1 file changed, 14 insertions(+)
> >>>
> >>> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wir=
eless/ath/ath11k/core.c
> >>> index 3f6f4db5b7ee1aba79fd7526e5d59d068e0f4a2e..21d366224e75904feeae6=
cb9c93d9ef692d127fe 100644
> >>> --- a/drivers/net/wireless/ath/ath11k/core.c
> >>> +++ b/drivers/net/wireless/ath/ath11k/core.c
> >>> @@ -1041,6 +1041,20 @@ static const struct dmi_system_id ath11k_pm_qu=
irk_table[] =3D {
> >>>                       DMI_MATCH(DMI_PRODUCT_NAME, "21D5"),
> >>>               },
> >>>       },
> >>> +     {
> >>> +             .driver_data =3D (void *)ATH11K_PM_WOW,
> >>> +             .matches =3D { /* P14s G5 AMD #1 */
> >>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> >>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "21ME"),
> >>> +             },
> >>> +     },
> >>> +     {
> >>> +             .driver_data =3D (void *)ATH11K_PM_WOW,
> >>> +             .matches =3D { /* P14s G5 AMD #2 */
> >>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> >>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "21MF"),
> >>> +             },
> >>> +     },
> >>>       {}
> >>>  };
> >>>
> >>>
> >>> ---
> >>> base-commit: dbd94b9831bc52a1efb7ff3de841ffc3457428ce
> >>> change-id: 20260330-p14s-pm-quirk-0a51ba19235f
> >>>
> >>> Best regards,
> >>
>

