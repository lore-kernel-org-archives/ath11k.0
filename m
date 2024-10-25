Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFC9D0C5F4
	for <ath11k@archiver.kernel.org>; Fri, 25 Oct 2024 09:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xf/w4k5F0vlDfNxk0QotDAoLa1cusJSFLofY2nsHp10=; b=wVQcKOWz96oPkz5qUpMdnyk+X6
	0SlLCVNVi+J6A22M5dlSwsC9F20aAkwHIR45EJRQuz2RlTtzbGhqFSBq6g6FYNFJ0+9C390N/XLPB
	r6bAxvnTD3wWdkL3O+7Qlstjpp4GVDyjndz3fP94eJu4f1AKP4Rnk2HvWBobD/JViwXZZtaxYvyGn
	+GqToHhpCNZQBcnoVHL8GczI31Ll3MQlCpdoHcfvj+Y70Xwx4AzZ/MOv3xOEPcBPKe2miYcEy5aOF
	hqmo71rYOHZIy8cJCQHnrFKoSOu/ogAmmTtf+L5wQDdqB1kPzBXZrU7TrJIO3pC1J7d0yqxCzRRqU
	SLVlUrnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4GaE-00000003AVs-2qqO;
	Fri, 25 Oct 2024 09:26:14 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4GaA-00000003ATf-0rEY
	for ath11k@lists.infradead.org;
	Fri, 25 Oct 2024 09:26:12 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2e2dcf4b153so1329545a91.1
        for <ath11k@lists.infradead.org>; Fri, 25 Oct 2024 02:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1729848369; x=1730453169; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xf/w4k5F0vlDfNxk0QotDAoLa1cusJSFLofY2nsHp10=;
        b=u7iUbeeMQEI0N25h7yAwsVm2QLyFDrtfpVKtSxkslmFgQPGTmpirydvbPw42Vf+oKU
         wEcVX3Fjrn2wpNQ+Qujo8GoBJsI2D6/SEXrjnR+rCUUGClLCBRMEnalKnqznznEYWlvc
         zmkFlSoT4hJT3lDKHVZLpKnpJNXXK5c5oGn0NDwaqXBvdLXBhFjpxxIQ401Uq8Al5+XP
         4dIdY31xA1J+tRdBdC/Uoj4QRxsUo0e/ZRuWD686WZqSlGPosrmR7QtOXMLE8uV0uvVU
         rjJdihtUMzdeH8Lf2Bg5oeI4p27zKSllCUcJgC7O1xg7t1eOs0kxodsFAEv4UFygG3Mx
         W7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729848369; x=1730453169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xf/w4k5F0vlDfNxk0QotDAoLa1cusJSFLofY2nsHp10=;
        b=oRk7SgBWcA04NEa+5o9JtKGrf439pK8z7LmTn9Vs1TTnIz/wYKiR9FtGogZPx2HpCf
         1vumfQekdXpppFqH/1KwsNltAgVsbTe6JB4y40uM7TM1kk7MUQ1kMogwhwG9khHQ8QYF
         rIuYxBDfhoYoQo5vVy3iTo36ESPlCTHhcKTSjPlOA8kxI9Gx/BgTV7BQGuGI6qc0goyG
         dXVKYLoLIGsclN/oT+pX51vRpFEdWFbh9J3hGs22wIgnnbGiELrwXCtftM9nle3K7BXR
         YMf6LSrWwEsBI4E9mWMeh9gyldMDTrxiWYZLUu54mljtzzPxX5dexNdelAzogFMq68mK
         HBzw==
X-Gm-Message-State: AOJu0Yw2FyZC3yIynSdLIRXvFXbDiyC8bo+2RiSzuTSa+8OI11i6LMmO
	uVBXEr52LP/6R7NXY/37LNpZli7Ds7vUs2Bqs4FLD+wpMnu9MahaEiUKfh8ycQcWLpYTepKms4P
	gMCJFIBBBeC5mlJ89NL/qQP3THdXpgb+mVwWZKD9i7vOVj9v+
X-Google-Smtp-Source: AGHT+IGjSddq0xpQ0GufRu0iHVXPUdFOualFWNtMDfs8OI/JqhpxGOQuYFfxKUFauGvqBnvz2WkKz6/3OHij95I2jjg=
X-Received: by 2002:a17:90a:ca14:b0:2e3:171e:3b8c with SMTP id
 98e67ed59e1d1-2e76b6eea92mr8763470a91.25.1729848368923; Fri, 25 Oct 2024
 02:26:08 -0700 (PDT)
MIME-Version: 1.0
References: <2102926591.3.1729848246704@boobie.home>
In-Reply-To: <2102926591.3.1729848246704@boobie.home>
From: Robert Marko <robert.marko@sartura.hr>
Date: Fri, 25 Oct 2024 11:25:57 +0200
Message-ID: <CA+HBbNHKmTCsSB8R8oGxPVYdD3MHdeUE0jksxMFYiA9WWO8xPA@mail.gmail.com>
Subject: Re: Is it possible to use multiple QCN9074 devices on the same system?
To: Ameer Antar <ameerantar@comcast.net>
Cc: ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_022610_274804_6E17D9F9 
X-CRM114-Status: GOOD (  17.24  )
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

On Fri, Oct 25, 2024 at 11:24=E2=80=AFAM Ameer Antar <ameerantar@comcast.ne=
t> wrote:
>
> I would like to know if there is a way to use multiple QCN9074 boards usi=
ng
> ath11k. I have several boards which use different radio spectrums, e.g. 5=
 and
> 6GHz. Unfortunately all these boards are unfused and map to board id 255.=
 I can
> get either one working by updating the board-2.bin file using ath11k-bden=
coder,
> but it looks like both radio versions have the same exact identifying inf=
o,
> 'chip_id 0x0 chip_family 0x0 board_id 0xff soc_id 0xffffffff' ->
> 'bus=3Dpci,qmi-chip-id=3D0,qmi-board-id=3D255'. The only differentiating =
property I
> could find seems to be the pci bus slot info, ie. bus/device number. Is t=
here
> any way to override the board id per device based on either the pci slot =
info
> or even the network interface name?
>
> I also suspect there is another issue beyond this regarding having multip=
le
> QCN9074 boards [1][2] which I'm not sure is resolved or if it will be.
> Unfortunately now I have to always use devices which use separate drivers=
 for
> the different spectrums, but this is far from ideal. For many devices, AP
> discovery requires a neighbor report rather than PSC, so in most setups h=
aving
> a 6GHz radio requires at least another radio to function properly.

Hi, currently you will have a QRTR ID clash with multiple PCI cards or
AHB+PCI combination.

Regards,
Robert

>
> Any advice/comments much appreciated.
>
> [1]
> https://patchwork.kernel.org/project/linux-wireless/patch/20221105194943.=
826847-2-robimarko@gmail.com/
> [2]
> https://patchwork.kernel.org/project/linux-wireless/patch/1614160542-2788=
2-1-git-send-email-akolli@codeaurora.org/
>


--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

