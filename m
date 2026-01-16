Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8D7C982C7
	for <ath11k@archiver.kernel.org>; Fri, 16 Jan 2026 14:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JBROiXfb/ZczWtty10y7qSloj9J1SUn7rTe2FXbu+XM=; b=k+ER3BXxF0a28Cod0+pvlgqc08
	cPur7UQJMs2tlpHNKANtBzQ6wzeRLp3DQRM/DcRcg9ao1/c5HvC8dUtXgJe+/gqoKqfXlOe6aLNly
	nWgdQkAUbWe1GZDjMA7thiZ9HBQLDKmTO1ci9mvHCcqT2Em542UGhYwsk7qn9AFJxqSAVrwTtPEqK
	BYXI908GKBPQUzzVg0dtmCOjP+JjBs6DKrEIy76kBAkvAGhpwVe2E+bT+1rFB0+ApgrTOJPDQgxrY
	kN3xVEu5t69x476U9Y7pOBudDrn4FzRkaWAxtg0KldGxWKOEl6LQ9WC/jHqfcq12ewP0eeAABF5EF
	+iVifrFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglIG-0000000EIj5-3zMQ;
	Fri, 16 Jan 2026 14:59:20 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglIE-0000000EIiS-3MRj
	for ath11k@lists.infradead.org;
	Fri, 16 Jan 2026 14:59:20 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-64b9230f564so2856967a12.1
        for <ath11k@lists.infradead.org>; Fri, 16 Jan 2026 06:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768575556; x=1769180356; darn=lists.infradead.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBROiXfb/ZczWtty10y7qSloj9J1SUn7rTe2FXbu+XM=;
        b=N3B9CaQBAsOMwubNu/DGxPlSOTL1d6sv/F3bb197rFuM07aK2/+RCLfhUHO45FMhl5
         45tSj2JquNk2j/tFDlZj+7sQBa1pLmD+IIH5zdRkcDC5bcjIF5GRsftVl5ExC7zCEQoU
         ZOhzXS+a0XbIUmk1FIvUYyhB9v0GKwPIZ6IH4YSwUlUb2tW6V4BDnK7k203jSc4J1Ves
         WizxB8ssSkaxFTCsbbFC7glOfmwrPR/15mzrgek2vI2neKil7kql17YxCbisqvlj8u5Q
         ydT8SdsWN9rrbaITv1Anov/doti+8UWqgZnjKJT/E0PyCY5leWDam7hqJEwdDsWrK281
         RVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768575556; x=1769180356;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JBROiXfb/ZczWtty10y7qSloj9J1SUn7rTe2FXbu+XM=;
        b=PNFBBlWpPomdUgyWbqpofHzIE8w3U43Q0hZgSzQQ18bijXOY/qkPlt+LMqVXOvFZij
         oWqfxPfEyX0CafZEQ+u+atYRWYj9tFIxL39o7Dc5qXk8pHC6Y9FP72pc+2eVGw6SThyH
         n94ME8Pv0OcphVu8j7fs5sqnX7lzmuOh7e5hklcIue9FauTmVJR5B+XEJRBrbsEJI/IG
         yKMZQY+DWblxVyiY+rKoI4kJQ7ghe68+kuitPi1SpUpojt0i0oqrzwj0mM6mI0usyzPi
         rhu4MEVTULWMJeNWhYwP+BgyihRI1EzDCciBvO5K2gJ5J57YVcuyDQATJK7ORKRyjcOv
         FEnw==
X-Forwarded-Encrypted: i=1; AJvYcCXpuQLDFioW/J6k/mZJxqF4bWOT5glwj6wTFITpU01I28vWK4vl2z57m+X34J9Y+BHc+jjW3M8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyBQVdpJTyZY4wpLrwwcMlUG6kQJldb6RDlqIrw4mBDUzZdIo8E
	49GbSGJorMGgR6pTFbEWo85vXTQKEHK5jxYQSzOrsq2c6VD745n91en+w+c27p/4mAY=
X-Gm-Gg: AY/fxX5oTfPqHvJoZN9zqr0HmQgNn97LUXKcYjhRjty41dKwrjj/7hiIx78B0LYMFNK
	yS7layxCTEy9D20e4OJ9BiBLH0lAHNprZkemzRqKM6sUU77M/kHlPJEXuSVuRiOD48DogmkGYJa
	NZddZxFzAd1hkpBJhOD5s3dKQw+T0zmqT569PtNiKIBAoRtNDH4XoRvQeEOrYY2LGQl50NRpa19
	QP+/2exLfRNMj2kHS5d9K57mSrOGK0RRnZt+68BtImrDaLbmwQeNTsFU6XGQaEm6oaCO84IyifT
	/n/wX+1LyQFkJBkGUgPVA/Q5FQ2XNCzRirZLE3ksuysKDyWqGDv8aL/K05MfzMeaJ6u5a85K1lh
	tKdfp2s47s1+lbYGEkOlrMFvctCt0ttTyeubgsKVPZ0j+O/xXU5rgXV1pk5DsM9klHwG14uaATn
	L/jJqmy/EZNauc3McM4CjbSnI0XdPIVE9yc/+TBceCOb/cvY8xxLWRbY6Z
X-Received: by 2002:a05:6402:234a:b0:64b:7885:c971 with SMTP id 4fb4d7f45d1cf-65452aca69bmr2326288a12.20.1768575556174;
        Fri, 16 Jan 2026 06:59:16 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654534c8791sm2484199a12.24.2026.01.16.06.59.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 06:59:15 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Jan 2026 15:59:15 +0100
Message-Id: <DFQ3PLTPB9ED.1Z8Y7PAQ3I5XG@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, <ath11k@lists.infradead.org>,
 <linux-arm-msm@vger.kernel.org>
Subject: Re: ath11k WiFi bringup on Milos SoC
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <DBF7OWAWQ94M.FSCP4DPF8ZJY@fairphone.com>
In-Reply-To: <DBF7OWAWQ94M.FSCP4DPF8ZJY@fairphone.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_065918_868724_D7F82D20 
X-CRM114-Status: GOOD (  16.91  )
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

On Fri Jul 18, 2025 at 3:23 PM CEST, Luca Weiss wrote:
> Hi,
>
> I'm trying to bring up WiFi on the Milos SoC (on my device: SM7635)
> which is paired with a WCN6755.
>
> There's also the WPSS remoteproc on this SoC, similar to SC7280/Kodiak.
>
> Using the qcom,wcn6750-wifi compatible in dt makes the wpss firmware
> crash soon after boot with the following errors:
>
> [ 1263.547381] ath11k 17110040.wifi: wcn6750 hw1.0
> [ 1263.577281] remoteproc remoteproc2: powering up wpss
> [ 1263.814337] remoteproc remoteproc2: Booting fw image qcom/milos/fairph=
one/fp6/wpss.mbn, size 8229144
> [ 1263.817861] PDM: no support for the platform, userspace daemon might b=
e required.
> [ 1264.523796] remoteproc remoteproc2: remote processor wpss is now up
> [ 1264.773557] ath11k 17110040.wifi: chip_id 0x1 chip_family 0xb board_id=
 0xff soc_id 0x40140120
> [ 1264.774484] ath11k 17110040.wifi: fw_version 0x3014ffff fw_build_times=
tamp 2025-04-09 08:57 fw_build_id WLAN.MSL.3.0.1-00328.3-QCAMSLSWPLZ-1.1059=
49.2
> [ 1272.362281] ath11k 17110040.wifi: htt event 48 not handled
> [ 1273.499832] qcom_q6v5_pas 8a00000.remoteproc: fatal error received: cm=
nos_assert.c:400:Asserted in whal_wmac_recipes.c:whal_wmac_transition_to_fw=
_control:1734
> [ 1273.500231] remoteproc remoteproc2: crash detected in wpss: type fatal=
 error
> [ 1273.501114] remoteproc remoteproc2: handling crash #1 in wpss
> [ 1273.501153] remoteproc remoteproc2: recovering wpss

To conclude this, this was missing a pinctrl for gpio5 of pmk8550 which
provides sleep clock to the LF_CLK_IN_GPIO pin of the WCN6755 PMU.

Downstream does define this but not in any way connected to anything
related to the WCN6755.

    &pmk8550_gpios {
    	pinctrl-0 =3D <&alt_sleep_clk_default>;
    	pinctrl-names =3D "default";

    	alt_sleep_clk {
    		alt_sleep_clk_default: alt_sleep_clk_default {
    			pins =3D "gpio5";
    			function =3D "func1";
    			input-disable;
    			output-enable;
    			bias-disable;
    			power-source =3D <0>;
    		};
    	};
    };

This is the upstream patch with the pinctrl defined:
https://lore.kernel.org/linux-arm-msm/20260116-milos-fp6-bt-wifi-v1-5-27b4f=
bb77e9c@fairphone.com/

With this added, the WPSS doesn't crash anymore and WiFi starts working.

Regards
Luca

>
> That "htt event 48" should be HTT_T2H_PPDU_ID_FMT_IND, I have briefly
> looked in the WiFi driver from the downstream 6.1 kernel and while I
> might definitely be wrong here, I'm guessing it's not related to the
> crash.
>
> Anyone have an idea how to debug this? Unfortunately my AMSS sources do
> not include any sources for WiFi, it's just prebuilts.
>
> Regards
> Luca


