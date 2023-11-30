Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 595A0C4167B
	for <ath11k@archiver.kernel.org>; Thu, 30 Nov 2023 08:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3TQqYuMpS0IutFQA0jTxrDWzedXIaMHOHDdeUN7WQuw=; b=3blDBTZfOwUl0X3y2q3pUxnKoy
	UYoy8ULo7w6q95d4tZNfcZssffp7l/Q049XL+yzjna+GDPaIf8F6Ml145ZdL4+b97+n/EnJyGy7jO
	W3kvod89GEa2a7iU5roTEMMslYrOxo2c6D9gF6TkTzSzM8sltnrrr6nrShRuEKZF4eQYoatuwTtQ2
	SFKrU+NI3VADx5OrhtkMzYlTcgRDLiepTHUaU42BFK5he5wKGJ0Mhy8BU3IqHfUPGGC/WR5g2Iks7
	HAjzFPHo84Oa1KkwFFNE64SJSb8jFQ5SbU+Ji6tT4Eg25E0QDdFp4tpLX1L2+rZPN3vqz7PpvmGKz
	8KzA6RJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8cLY-00ACeG-2Y;
	Thu, 30 Nov 2023 08:24:32 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8cLW-00ACda-00
	for ath11k@lists.infradead.org;
	Thu, 30 Nov 2023 08:24:31 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40b54261534so5279185e9.3
        for <ath11k@lists.infradead.org>; Thu, 30 Nov 2023 00:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701332667; x=1701937467; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3TQqYuMpS0IutFQA0jTxrDWzedXIaMHOHDdeUN7WQuw=;
        b=hmssAt2gRcLwC4F4RVu++HqdU8wTyStmbAvirWevEqJ7FoZ8RplmLNGcOVnkBQOfIJ
         ncii2zI/zLAxc/CS63EK0bLOiWr7FgdzjsYWWMmJHAGRG0KqYbGGnWPWFXueN0fgM/NC
         mB4X5PPHsHOOiOQLQ6JTIFKgwFptpbpL124avohFe4bd7e15cdgTLErDT5IJdttYoVGm
         cGOtFFBSaj7uPrRv/v9z3Gn+VcQ2KthwUacc82VwKDbo0Z4qFw4DMSUBxZkUEj+QTluG
         qoQVFBG4Ze227B3K4K1dOlbKpJWnENauS0mm55pVIK6ieupRs9dxoP36HATK6fGOWjLB
         O8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701332667; x=1701937467;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3TQqYuMpS0IutFQA0jTxrDWzedXIaMHOHDdeUN7WQuw=;
        b=bHZW+IbqbQFr6EY2/uechHH16Co90/uM5NOgN5OMLk3Ae8t+GCS4+O0M4ciW1hnDOh
         XGgHK3elATWUPvST+EQJTnVvhBsu8ZIQndmRgV6m4GyDkO++LDJh7GaF6SBTPFNTAC+O
         hjH2DM5GjI6CrRFY3myjZtm7LCYqVzG8+C6jJ+9L6Tk+YWIP8km3OXw1xBzKHOX5TywM
         gNPoifydQVo5XuuNYRfCrRD3H2c4if0cmZ/hyQ1PYsYBo+QdqIOPVLmjij9KSnUVwgAf
         XteQNZuaTVjBeMNmclELxf1mTCOIFB0vGMxvD4QpxsxwvSKh0I02EDOubrI4SauhJzEY
         Rg4w==
X-Gm-Message-State: AOJu0YzWCVgmMqKrtmZnazzksBqd3x9IsG/oYLAp7z17sxqw5ufritoO
	hnNWzz4Xd0Z+dhSkoR795mdDr67DqLY=
X-Google-Smtp-Source: AGHT+IHWJgbhZy4z5ajH3SCgvaHk+CQS1O+0oW2p34le3I8bCk5zc+Q4Ge9qW03jVvhxInLNxkWE2A==
X-Received: by 2002:a05:600c:3b20:b0:40b:3e23:f0a0 with SMTP id m32-20020a05600c3b2000b0040b3e23f0a0mr11358637wms.4.1701332667016;
        Thu, 30 Nov 2023 00:24:27 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id p23-20020a05600c1d9700b0040b3645a7c2sm4839247wms.40.2023.11.30.00.24.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 00:24:26 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Nov 2023 09:24:26 +0100
Message-Id: <CXC03GYAN4VN.2PQ88Q1S7IL6H@gmail.com>
Subject: Re: [PATCH] wifi: ath11k: fix layout of scan_flags in struct
 scan_req_params
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Jeff Johnson" <quic_jjohnson@quicinc.com>, "Kalle Valo"
 <kvalo@kernel.org>
Cc: <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <ath11k@lists.infradead.org>
X-Mailer: aerc 0.15.2
References: <20231127180559.1696041-1-nico.escande@gmail.com>
 <bdcdbd06-e9bd-4a92-b27b-d94b2d8fb52d@quicinc.com>
 <CX9YPUDTAT1N.23DMRB5O9FEAO@gmail.com>
 <20c7a367-2243-4e13-b023-9999dc6c6790@quicinc.com>
In-Reply-To: <20c7a367-2243-4e13-b023-9999dc6c6790@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_002430_046561_EDA659DA 
X-CRM114-Status: GOOD (  14.41  )
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

On Tue Nov 28, 2023 at 1:57 AM CET, Jeff Johnson wrote:
> On 11/27/2023 2:54 PM, Nicolas Escande wrote:
[...]
> > So either we should not use WMI_SCAN_XXX with scan_req_params.scan_flag=
s ever
> > and only use the bitfield to set scan parameters or if we use WMI_SCAN_=
XXX with
> > scan_req_params.scan_flags they need to match the corresponding bitfiel=
d.
>
> IMO the correct thing to do is to remove the unions from that struct and
> only leave behind the bitfields and not use the WMI_SCAN_XXX masks
> except when filling the firmware structure.
>
> But don't spin an update to your patches until Kalle has a chance to
> give his opinion. I'm new to maintaining these drivers and Kalle may
> have a different opinion on this.
>
> /jeff

No problem, I'll wait for Kalle's input on this before doing anything.
As soon as we decide which way is the right way, I'll work on this. I only =
care
that this gets resolved.

