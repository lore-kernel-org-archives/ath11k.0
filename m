Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7859DC25B72
	for <ath11k@archiver.kernel.org>; Fri, 27 Oct 2023 10:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JE8IbvsNcouRbyK5VpQkAN8P6BMA8CQ1NAOHsulwEEM=; b=CLGkvXs1M8PTY8
	QPvyJqWcgECXmr3fTD6Srxx/JPSPlOwsK9Mt4BLB46F5uV4VISfPPghfoKtVYGR2KCnOx7cnasV1u
	m+7LIYkoL0WZIubK4dkCuUbSRFBwbudid8fNxWr9787Kw7dHbIGM3RZ+GwHVRweTNAkn+SZopWrZw
	kHOxJ4Ci65RB9+xRoUwCeRP2cTjeN8QH4bbPCYdzJk25/Ud9U6mVHuCybtMvn6tAOabL7PSdrruF1
	YnezeTom43E6KEtgi6uXQusXsbcin3KqbWAF2Z2Zw8+2vNtc6ZfqbddyRKAl0JRIRDYLMMax8yPXB
	GqrTCaaAJQEkLEAMG/Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwJkK-00G5ac-2k;
	Fri, 27 Oct 2023 10:07:16 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwJkH-00G5a4-2I
	for ath11k@lists.infradead.org;
	Fri, 27 Oct 2023 10:07:15 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-99357737980so296919066b.2
        for <ath11k@lists.infradead.org>; Fri, 27 Oct 2023 03:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1698401230; x=1699006030; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2ttGxsEpCovYo5WGBI/2wLRWRua0I9N3WCMj8o9qdk=;
        b=Oo63YK0m7H9i798yed8R/1BLAELmELk83tZTPxWie0506a8lDidX0nMchZC402Ao7M
         gUtQsIo2LXsDnDVMGSpp7/0hQ54mQA8Pmatq1tXQErsVmB/I+dpR1/fTA70Wr629K28X
         oXYuGPXrqKNaxdA6IujNMu0pec8IdPhfz3wcJnOmy6Gu7947v6VJBEgppNpeSyOVOGXw
         XyZ0WaiVlkmIAcUWzwRIf861Bolem2F7oEX9oTfntXoY9sWINOsyD4ydU3CX1TM18gVd
         yrWSQ7Sz3zuuAhj/T7FQVdv7vIL/854EbIHoxRF6gx1C9TIJ7JDRwFqAH48C7BmmxaU4
         R2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698401230; x=1699006030;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W2ttGxsEpCovYo5WGBI/2wLRWRua0I9N3WCMj8o9qdk=;
        b=EiPPK4nXtXNGigCeISiR7HUWlPLtwgBMBemu+O6S7O2Vl/RawkVMhONpCu+vIZy9GW
         W3hhRxyfIjY0WwIP7cRH+l9qyJ2ynysxUppUk1cxrEB2ObNqEwdDXgLdFU36AUEahjsO
         htk529t5Tx4BTOIGSHwji1PzUQGvAWf3gqIVmDLOZEhpFZ8AC3aUx1E+YD1WPc2t0UGM
         vmFsGJKPNO8fq4H1TFypt0XELcm/90G5S2bLEatYtmnZ39m4hWX/PE+Gon9bU1ZxO80s
         j8bCkLU0fXKE3b77C/FsnBl43SwxT1wbT1ULOfP57uCnK4RztB2DPsooUsi1dtpolZdv
         rrDA==
X-Gm-Message-State: AOJu0YwdlREoZ9xEK37brWEMNFxPZvFB/SIaO594mJ11pIZQYqE3PS3S
	pKmW0cafZGYkNE3cZIPKYtq+f0vaee5Q2aUzM1LdWw==
X-Google-Smtp-Source: AGHT+IHwXW32IKOGavGwueMqyskdd7p7jS6bw8H7bAFEFW4DJTD6sjtVirXz5fvBiW1yOPC8GSFVTQ==
X-Received: by 2002:a17:906:fe4c:b0:9be:2991:81fa with SMTP id wz12-20020a170906fe4c00b009be299181famr1956326ejb.39.1698401229965;
        Fri, 27 Oct 2023 03:07:09 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id c16-20020a1709060fd000b0099cb349d570sm949317ejk.185.2023.10.27.03.07.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Oct 2023 03:07:09 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 27 Oct 2023 12:07:09 +0200
Message-Id: <CWJ4ZLEZCKQC.2STOBNUU06B2P@fairphone.com>
Cc: "Jeff Johnson" <quic_jjohnson@quicinc.com>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath11k: Defer on rproc_get failure
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Kalle Valo" <kvalo@kernel.org>
X-Mailer: aerc 0.15.2
References: <20231027-ath11k-rproc-defer-v1-1-f6b6a812cd18@fairphone.com>
 <87lebowjyf.fsf@kernel.org>
In-Reply-To: <87lebowjyf.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_030713_770665_F760087C 
X-CRM114-Status: GOOD (  18.30  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Fri Oct 27, 2023 at 10:25 AM CEST, Kalle Valo wrote:
> Luca Weiss <luca.weiss@fairphone.com> writes:
>
> > If we already have gotten the rproc_handle (meaning the "qcom,rproc"
> > property is defined in the devicetree), it's a valid state that the
> > remoteproc module hasn't probed yet so we should defer probing instead
> > of just failing to probe.
> >
> > This resolves a race condition when the ath11k driver probes and fails
> > before the wpss remoteproc driver has probed, like the following:
> >
> >   [    6.232360] ath11k 17a10040.wifi: failed to get rproc
> >   [    6.232366] ath11k 17a10040.wifi: failed to get rproc: -22
> >   [    6.232478] ath11k: probe of 17a10040.wifi failed with error -22
> >        ...
> >   [    6.252415] remoteproc remoteproc2: 8a00000.remoteproc is available
> >   [    6.252776] remoteproc remoteproc2: powering up 8a00000.remoteproc
> >   [    6.252781] remoteproc remoteproc2: Booting fw image qcom/qcm6490/fairphone5/wpss.mdt, size 7188
> >
> > So, defer the probe if we hit that so we can retry later once the wpss
> > remoteproc is available.
> >
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>
> Did you test this on a real device? If yes, what ath11k hardware and firmware
> did you use? We use Tested-on tag to document that:
>
> https://wireless.wiki.kernel.org/en/users/drivers/ath11k/submittingpatches#tested-on_tag

Hi,

Yes I tested this on qcm6490-fairphone-fp5 including some extra patches
for wpss-pas remoteproc support (nothing special, just adding it to the
existing PAS driver) and wifi enablement in dts.

I built this line from info from the dmesg, hope it's okay:

Tested-on: wcn6750 hw1.0 AHB WLAN.MSL.1.0.1-01264-QCAMSLSWPLZ-1.37886.3


And thinking about it, a Fixes tag would also be appropriate for this
patch.
The code was moved to a different file in commit ba929d6fe31a ("ath11k:
Remove rproc references from common core layer") but I think this tag
should be correct.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")

>
> I can add that in the pending branch if you provide the info.

Thanks!

Regards
Luca

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
