Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A975C433F5
	for <ath11k@archiver.kernel.org>; Thu, 28 Apr 2022 23:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z7XXwKeemNLMsVSnIpO1UX9lkOiz0rdOnATLUvTc2j8=; b=04EK08WFKTgt/g
	GApffFYsj9zNbR81XIp8zlfwG4nmZ4XcSLTLb0wjo1Q2VH8Iyncrx0jUb3eHd1h/IvlryWOObJ9l4
	sF+2VuBLMigRzfOqAxPseMl+YKCuZcklMTOTYKSZ1Rhh9+qsMv1XAefM+0OUpR+b6nKZtqes62E9j
	47wflgD5qLeHN5F0zgJKlkGqLpd2EJsCptcd3BoILsxOcxuP3iWzABBXOzFMyw2Ojuzsqp5Zm+moJ
	hhLbGcvbkiQZ9WEPEclzg9FFa9OcP6xQ3fJAJEaSB409r8xtknH+xoDSqbYZHD96qoxpWhO5Xp74b
	k/CxJdk2dRkbZlixup6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkDnV-0092SR-5Y; Thu, 28 Apr 2022 23:43:45 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkDnS-0092Rd-0h
 for ath11k@lists.infradead.org; Thu, 28 Apr 2022 23:43:43 +0000
Received: by mail-lj1-x22b.google.com with SMTP id g16so3126964lja.3
 for <ath11k@lists.infradead.org>; Thu, 28 Apr 2022 16:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=aqE1ybcBL/9Io1ScprRN5X8xoUPpj/53FgjLBSm+a3E=;
 b=lxki6vTYGORyK08qGDPKngEowCLCBVaCBSZEGWQlu6nWE2K/HDz5TEWPlIEh6JYjA7
 ol6W4DSIJpTExiwf0DhTEPfTjF00/AVCWgAVP9OFG3r4NlmjPnQ0vxz7uefor6cPQ/KN
 nQPBTbh47G1Frsy42kFTAon9ha9lF6/L2byg5zr98ok6bbNXxfcZj+BFB44+v6dcehRv
 g41qCNQaXBIjQ+hZJFz8m7uuIp0KbGXsn35ykSIjKtt834xscr61yTLvlSbdUM4sNF5h
 FEaD3/M6oV/Wo2xeUDoAEUpwUvLf8QZ7F90Evzp1E3wdFxvZVO6qhgzXnnOY0MGBmuyv
 4/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aqE1ybcBL/9Io1ScprRN5X8xoUPpj/53FgjLBSm+a3E=;
 b=MDpJqw0DnwoaRfnB5YDK99Izt/G6SPTTEyoxVKMIimRBjzHmq687ZDWvteaxMpXwmk
 FvS1EdphH7r8dQb4jRpPtaUFKXTEYeFXpQk3+cCs46019OWaZaF2rDkLodyRX90JB6MR
 0IDt7rJRGkkfrvlTn1wFDHzkvQUNU/xwISVCsjOhBC3nrvoVWTHZGLxFCbshKVeKdHXe
 QmQjueqbCexWZvk+J6DLGMl+KkJdpMY8Y9kazHfP54N5Tw+xP9XurV6grDjUMfMcPjfW
 kVZSCreGX5XyEtJZUzXaL8+sw53OofgaZUCbQtIVM/XL1c+WjYI3gs6LkQ66vI8sh5NY
 bCXQ==
X-Gm-Message-State: AOAM533V+8nMnMuHVXNzIDSeC6dj10Aj1CTfNrNdYhYf+OPIwwjTnIP+
 vS6BGdaL8S2exypEz9IjmCS0fw==
X-Google-Smtp-Source: ABdhPJyRc/4TPe9KRmlXDLktw2VFls0ZibH+HcyAdhSUyaAKghaY4CA0SFGQB5P0Pse71H7ZMlMUmQ==
X-Received: by 2002:a2e:854b:0:b0:24f:b98:e2d2 with SMTP id
 u11-20020a2e854b000000b0024f0b98e2d2mr17650865ljj.165.1651189419275; 
 Thu, 28 Apr 2022 16:43:39 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 w22-20020a194916000000b0046ba5a6ff16sm109966lfa.11.2022.04.28.16.43.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 16:43:38 -0700 (PDT)
Message-ID: <332e62e5-b04d-3a6a-38fe-924d056bf0f8@linaro.org>
Date: Fri, 29 Apr 2022 02:43:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PULL linux-firmware] ath10k & ath11k firmware 20220423
Content-Language: en-GB
To: Kalle Valo <kvalo@qca.qualcomm.com>,
 "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>,
 "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
References: <BYAPR02MB4567E377F14F272DFF48907A92FA9@BYAPR02MB4567.namprd02.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <BYAPR02MB4567E377F14F272DFF48907A92FA9@BYAPR02MB4567.namprd02.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_164342_181432_022C9EEB 
X-CRM114-Status: GOOD (  17.11  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi Kalle,

On 27/04/2022 11:32, Kalle Valo wrote:
> Add support for QCN9074 and WCN6750 ath11k hardware families. Also
> there are several updates to existing firmwares and board files for both ath10k
> and ath11k.
> 
> Please let me know if there are any problems.

I noticed that this pull request doesn't include the board file for 
WCN3990. Is there any issue with it that we can solve on our side?

> 
> Kalle
> 
> The following changes since commit e6553076626e932983b1947e1cc593421cb83aa8:
> 
>    Mellanox: Add new mlxsw_spectrum firmware xx.2010.1502 (2022-04-21 06:46:21 -0400)
> 
> are available in the Git repository at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware.git ath10k-20220423
> 
> for you to fetch changes up to 4a0e59f95830817b1601631281191a5c3327d138:
> 
>    ath11k: QCA6390 hw2.0: update to WLAN.HST.1.0.1-05266-QCAHSTSWPLZ_V2_TO_X86-1 (2022-04-27 11:23:17 +0300)
> 
> ----------------------------------------------------------------
> Kalle Valo (19):
>        ath11k: IPQ6018 hw1.0: update board-2.bin
>        ath11k: IPQ6018 hw1.0: update to WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1
>        ath11k: IPQ8074 hw2.0: update board-2.bin
>        ath11k: IPQ8074 hw2.0: update to WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1
>        ath11k: QCA6390 hw2.0: update board-2.bin
>        ath11k: QCN9074 hw1.0: add board-2.bin
>        ath11k: QCN9074 hw1.0: add to WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1
>        ath11k: WCN6750 hw1.0: add board-2.bin
>        ath11k: WCN6750 hw1.0: add to WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
>        ath11k: WCN6855 hw2.0: update to WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.7
>        ath10k: QCA99X0 hw2.0: add board-2.bin
>        ath10k: QCA4019 hw1.0: update board-2.bin
>        ath10k: QCA6174 hw3.0: update firmware-6.bin to WLAN.RM.4.4.1-00288-QCARMSWPZ-1
>        ath10k: QCA6174 hw3.0: update board-2.bin
>        ath10k: QCA9888 hw2.0: update firmware-5.bin to 10.4-3.9.0.2-00156
>        ath10k: QCA9888 hw2.0: update board-2.bin
>        ath10k: QCA9984 hw1.0: update firmware-5.bin to 10.4-3.9.0.2-00156
>        ath10k: QCA9984 hw1.0: update board-2.bin
>        ath11k: QCA6390 hw2.0: update to WLAN.HST.1.0.1-05266-QCAHSTSWPLZ_V2_TO_X86-1
> 
>   WHENCE                              |   34 +-
>   ath10k/QCA4019/hw1.0/board-2.bin    |  Bin 607304 -> 1129788 bytes
>   ath10k/QCA6174/hw3.0/board-2.bin    |  Bin 715444 -> 731852 bytes
>   ath10k/QCA6174/hw3.0/firmware-6.bin |  Bin 702844 -> 706004 bytes
>   ath10k/QCA9888/hw2.0/board-2.bin    |  Bin 84928 -> 133540 bytes
>   ath10k/QCA9888/hw2.0/firmware-5.bin |  Bin 691292 -> 693604 bytes
>   ath10k/QCA9984/hw1.0/board-2.bin    |  Bin 171916 -> 220528 bytes
>   ath10k/QCA9984/hw1.0/firmware-5.bin |  Bin 679288 -> 681568 bytes
>   ath10k/QCA99X0/hw2.0/board-2.bin    |  Bin 0 -> 157680 bytes
>   ath10k/QCA99X0/hw2.0/board.bin      |  Bin 12064 -> 0 bytes
>   ath11k/IPQ6018/hw1.0/Notice.txt     | 3916 +++++++++++++++++--
>   ath11k/IPQ6018/hw1.0/board-2.bin    |  Bin 787208 -> 787208 bytes
>   ath11k/IPQ6018/hw1.0/m3_fw.b01      |  Bin 6712 -> 6712 bytes
>   ath11k/IPQ6018/hw1.0/m3_fw.b02      |  Bin 294912 -> 294912 bytes
>   ath11k/IPQ6018/hw1.0/m3_fw.mdt      |  Bin 6860 -> 6860 bytes
>   ath11k/IPQ6018/hw1.0/q6_fw.b00      |  Bin 340 -> 340 bytes
>   ath11k/IPQ6018/hw1.0/q6_fw.b01      |  Bin 7000 -> 7000 bytes
>   ath11k/IPQ6018/hw1.0/q6_fw.b02      |  Bin 4696 -> 4696 bytes
>   ath11k/IPQ6018/hw1.0/q6_fw.b03      |  Bin 2357712 -> 2557136 bytes
>   ath11k/IPQ6018/hw1.0/q6_fw.b04      |  Bin 370560 -> 412064 bytes
>   ath11k/IPQ6018/hw1.0/q6_fw.b05      |  Bin 175588 -> 198052 bytes
>   ath11k/IPQ6018/hw1.0/q6_fw.b07      |  Bin 8936 -> 9416 bytes
>   ath11k/IPQ6018/hw1.0/q6_fw.b08      |  Bin 409914 -> 453364 bytes
>   ath11k/IPQ6018/hw1.0/q6_fw.mdt      |  Bin 7340 -> 7340 bytes
>   ath11k/IPQ8074/hw2.0/Notice.txt     | 3916 +++++++++++++++++--
>   ath11k/IPQ8074/hw2.0/board-2.bin    |  Bin 1311380 -> 1311380 bytes
>   ath11k/IPQ8074/hw2.0/m3_fw.b01      |  Bin 136 -> 136 bytes
>   ath11k/IPQ8074/hw2.0/m3_fw.b02      |  Bin 327680 -> 327680 bytes
>   ath11k/IPQ8074/hw2.0/m3_fw.mdt      |  Bin 284 -> 284 bytes
>   ath11k/IPQ8074/hw2.0/q6_fw.b00      |  Bin 340 -> 340 bytes
>   ath11k/IPQ8074/hw2.0/q6_fw.b01      |  Bin 328 -> 328 bytes
>   ath11k/IPQ8074/hw2.0/q6_fw.b02      |  Bin 4696 -> 4696 bytes
>   ath11k/IPQ8074/hw2.0/q6_fw.b03      |  Bin 2589264 -> 2934864 bytes
>   ath11k/IPQ8074/hw2.0/q6_fw.b04      |  Bin 985504 -> 1009888 bytes
>   ath11k/IPQ8074/hw2.0/q6_fw.b05      |  Bin 387076 -> 243652 bytes
>   ath11k/IPQ8074/hw2.0/q6_fw.b07      |  Bin 7048 -> 9816 bytes
>   ath11k/IPQ8074/hw2.0/q6_fw.b08      |  Bin 424524 -> 486546 bytes
>   ath11k/IPQ8074/hw2.0/q6_fw.mdt      |  Bin 668 -> 668 bytes
>   ath11k/QCA6390/hw2.0/Notice.txt     | 4839 ++++++++++++++++-------
>   ath11k/QCA6390/hw2.0/amss.bin       |  Bin 3609456 -> 3628672 bytes
>   ath11k/QCA6390/hw2.0/board-2.bin    |  Bin 58016 -> 115984 bytes
>   ath11k/QCA6390/hw2.0/m3.bin         |  Bin 266684 -> 266684 bytes
>   ath11k/QCN9074/hw1.0/Notice.txt     | 4094 +++++++++++++++++++
>   ath11k/QCN9074/hw1.0/amss.bin       |  Bin 0 -> 11905872 bytes
>   ath11k/QCN9074/hw1.0/board-2.bin    |  Bin 0 -> 786836 bytes
>   ath11k/QCN9074/hw1.0/m3.bin         |  Bin 0 -> 340108 bytes
>   ath11k/WCN6750/hw1.0/Notice.txt     | 7380 +++++++++++++++++++++++++++++++++++
>   ath11k/WCN6750/hw1.0/board-2.bin    |  Bin 0 -> 843548 bytes
>   ath11k/WCN6750/hw1.0/wpss.b00       |  Bin 0 -> 340 bytes
>   ath11k/WCN6750/hw1.0/wpss.b01       |  Bin 0 -> 6848 bytes
>   ath11k/WCN6750/hw1.0/wpss.b02       |  Bin 0 -> 10300 bytes
>   ath11k/WCN6750/hw1.0/wpss.b03       |  Bin 0 -> 4096 bytes
>   ath11k/WCN6750/hw1.0/wpss.b04       |  Bin 0 -> 5783231 bytes
>   ath11k/WCN6750/hw1.0/wpss.b05       |  Bin 0 -> 175236 bytes
>   ath11k/WCN6750/hw1.0/wpss.b06       |  Bin 0 -> 266684 bytes
>   ath11k/WCN6750/hw1.0/wpss.b07       |  Bin 0 -> 1176368 bytes
>   ath11k/WCN6750/hw1.0/wpss.b08       |    0
>   ath11k/WCN6750/hw1.0/wpss.mdt       |  Bin 0 -> 7188 bytes
>   ath11k/WCN6855/hw2.0/amss.bin       |  Bin 4972544 -> 4972544 bytes
>   59 files changed, 22238 insertions(+), 1941 deletions(-)
>   create mode 100644 ath10k/QCA99X0/hw2.0/board-2.bin
>   delete mode 100644 ath10k/QCA99X0/hw2.0/board.bin
>   create mode 100644 ath11k/QCN9074/hw1.0/Notice.txt
>   create mode 100644 ath11k/QCN9074/hw1.0/amss.bin
>   create mode 100644 ath11k/QCN9074/hw1.0/board-2.bin
>   create mode 100644 ath11k/QCN9074/hw1.0/m3.bin
>   create mode 100644 ath11k/WCN6750/hw1.0/Notice.txt
>   create mode 100644 ath11k/WCN6750/hw1.0/board-2.bin
>   create mode 100644 ath11k/WCN6750/hw1.0/wpss.b00
>   create mode 100644 ath11k/WCN6750/hw1.0/wpss.b01
>   create mode 100644 ath11k/WCN6750/hw1.0/wpss.b02
>   create mode 100644 ath11k/WCN6750/hw1.0/wpss.b03
>   create mode 100644 ath11k/WCN6750/hw1.0/wpss.b04
>   create mode 100644 ath11k/WCN6750/hw1.0/wpss.b05
>   create mode 100644 ath11k/WCN6750/hw1.0/wpss.b06
>   create mode 100644 ath11k/WCN6750/hw1.0/wpss.b07
>   create mode 100644 ath11k/WCN6750/hw1.0/wpss.b08
>   create mode 100644 ath11k/WCN6750/hw1.0/wpss.mdt


-- 
With best wishes
Dmitry

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
