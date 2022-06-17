Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08556C43334
	for <ath11k@archiver.kernel.org>; Fri, 17 Jun 2022 07:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=cWp3Z4ZItZdmApjVgrx/W476hVNAVfvKRFrADTUHtEU=; b=2Cr
	8U/mj67kpDVHtWkZfzbzyvqn5gnQ9yqbLQgRdDP5BLxwee+Vw5QAlWpbLJ2YBBjMsVMcApb/htLlp
	yVdOkX8OK7euZsrXkcXpffpECTlKkLG2ZUbU4Ap0Ccd2/8km69nIrfvf6803vmJI6Fq5np5zFQeYw
	Jhc0BUdnPiykwqv97Q8NyTacixiokMiJpIU0fPjwkpSJ0qmT5bWihRKxz1Er6RPy4UBlo2eFz3/aU
	AriPqdDCwqkjktoqNK6xFuZN1zgigj7lTIHq5XE7YHUlq7rW89YeCx+WUBoGiF5ZNKsJhu4dFfJYb
	LlLUYVziMQ42z2iXfITo5uxxwgmBnzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o26Rx-005yZf-4F; Fri, 17 Jun 2022 07:31:25 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o26HO-005uy0-OU
	for ath11k@lists.infradead.org; Fri, 17 Jun 2022 07:20:32 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-1016409cf0bso4603386fac.12
        for <ath11k@lists.infradead.org>; Fri, 17 Jun 2022 00:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=virginia.edu; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=+G4NjavF3WaoQEof3jjdRTAu5Z+70E8PGDWf4yrlBkg=;
        b=aE9hMIOo6oEufmt6aH8cEvcQWEKXRGjelylnbPmbFXSoKdS+UZlVojfJlt87iGxMzQ
         4rLhur3c0mWJTludZOn6LDCfoq68DR57vuUKj355LEbrBK23nMmPNeZdoqwAyTgwDgBY
         JX8eCWMNKtvXJmMhUzkLTbpn1IRKc+11KBz4WHe8V3HDuAbpgo2DwxUUNTI3xlCHowtn
         UuIqfSvXoP2YfRJk4CCtJ4Cr8fAMOXKebGS/qwtPbTUr+0Z+tB8RM2wB3yAAECG/UtI9
         yG4RDpBR1olLGnQ+QlG/rGUSmPZmrcV6qmsToGCYCo/vVT5FFE96z8Awm11H82ds3RXm
         Y3UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=+G4NjavF3WaoQEof3jjdRTAu5Z+70E8PGDWf4yrlBkg=;
        b=NPf7niwt5eFDxlQDYvSo2O8nbaenAJ/6hZfq4CYI8lNgV8DForGMzJMgYtz5J8/xgs
         f4oMN2UXsZ/YovTc1A4EhWt8L1uHDlDwRiQodmg0AZyYH2KKFqJm7aoH4DMbv8Yp2yjY
         ISXEWYTFfUzUqRer4FGXEjb3MDtnzOrCmSDRJGcXWLh39sjb37VoYu2fcDCkxiQnZcUi
         NWBWTUTmvOCWUzrhFM/fv/pbmEo2TJ9JVReK9jIkMebxHpU6Bh6vHxEhdnEYi2ru9Te8
         mTlPLmet/tzRns39gxiAxM4smY6InD+bxkFUGHNbggPvfAcC/jvfHzVRRxvPW6Au6WaZ
         AExQ==
X-Gm-Message-State: AJIora9e7yYRgf9E5ANzg6gPHDyXL3G+cbP0vp90/syZhbDPJVXqseII
	W44gBBOkcsipJWoAcirNqxydI01PraAeGM1JrGNoR2TDeV2Ieg==
X-Google-Smtp-Source: AGRyM1vLLebHI1etiMi29MHrpt2qTxhXZGrz1t6YkTMu/Efl8Lpsca86IpEMfkzl0MzQaosZUjZeq1V2hK8mtEuALFs=
X-Received: by 2002:a05:6870:f149:b0:de:e873:4a46 with SMTP id
 l9-20020a056870f14900b000dee8734a46mr4797028oac.286.1655450426013; Fri, 17
 Jun 2022 00:20:26 -0700 (PDT)
MIME-Version: 1.0
From: Thomas Duffy <ted4q@virginia.edu>
Date: Fri, 17 Jun 2022 03:20:09 -0400
Message-ID: <CA+2MDz=T79jdpug_-PkOftNGbhr3xq=sPJU8go=03t0_kZYG7w@mail.gmail.com>
Subject: QCN9074 mhi Issues
To: ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_002030_836758_53F13525 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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

I had been waiting for the ath11k driver and QCN9074 firmware to
mature, and it appears that this is the case, as the driver is now in
mainline kernel and the firmware is in linux-kernel.

However, my setup just doesn't work, and I am hoping for some help
troubleshooting.

I have a supermicro X10SDV-4C+-TLN4F board which has a Xeon D-1518
processor that is paired with a Compex WLE3000H2 Wifi 6 5Ghz card.
Vt-d is enabled in BIOS.

I am running Ubuntu 22.04 Server which has kernel 5.15 and thus has the driver.

I have board-2.bin, amss.bin, and m3.bin all in the correct folder
(lib/firmware/ath11k/QCN9074/hw1.0) from
https://github.com/kvalo/ath11k-firmware/tree/master/QCN9074/hw1.0

lspci output shows the card:

06:00.0 Network controller: Qualcomm Device 1104 (rev 01)

The ath11k_pci driver finds and enables the device:

[    9.344266] ath11k_pci 0000:06:00.0: BAR 0: assigned [mem
0xfb200000-0xfb3fffff 64bit]
[    9.344294] ath11k_pci 0000:06:00.0: enabling device (0100 -> 0102)
[    9.369190] ath11k_pci 0000:06:00.0: qcn9074 hw1.0

But then fails to start the device with mhi errors:

[    9.494081] ath11k_pci 0000:06:00.0: failed to set mhi state: POWER_ON(2)
[    9.494087] ath11k_pci 0000:06:00.0: failed to start mhi: -110
[    9.494094] ath11k_pci 0000:06:00.0: failed to power up :-110
[    9.588331] ath11k_pci 0000:06:00.0: failed to create soc core: -110
[    9.592083] ath11k_pci 0000:06:00.0: failed to init core: -110
[   10.339939] ath11k_pci: probe of 0000:06:00.0 failed with error -110

The dmesg output for mhi is:

[    9.456834] mhi mhi0: Requested to power ON
[    9.457281] mhi mhi0: Power on setup success
[    9.472444] mhi mhi0: Image transfer failed
[    9.475709] mhi mhi0: Reg: ERROR_CODE value: 0xef128100
[    9.479172] mhi mhi0: Reg: ERROR_DBG1 value: 0xfffa0000
[    9.482722] mhi mhi0: Reg: ERROR_DBG2 value: 0x0
[    9.482727] mhi mhi0: Reg: ERROR_DBG3 value: 0x1ef13
[    9.482744] mhi mhi0: MHI did not load image over BHI, ret: -5

Does anyone have any suggestions?

Thanks,

TD

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
