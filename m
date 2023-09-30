Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB16E7734F
	for <ath11k@archiver.kernel.org>; Sat, 30 Sep 2023 04:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:To:MIME-Version:Date:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V027D9LZG4g0ASpzWrBoAgBuqT98q9hkunZpNZoM9Sc=; b=AQcO6Gr6CZ/BZ2
	VeZUc4OxpOYK2FgLh8yAxFBT92YnC2TPiq0dLdhMkziUhLZv89XeRkUol7RWCUk2s5C3qagmfhx6m
	5czQ7O9ijv0swDOz8WK5+KYcI6qCtfgp3571KycHv3fly4yMsUB/uVUslM1IxXMYwbUHtJjPlJb3E
	BCp+ZIoZFSK5/jCVjCy/YT2ADbCjNGxr3tAF4Jbz62ZsLmVaCsW+sW20U15Sq9Fd/+DeD6jJ7MlJE
	d56YoMQTJHPHNj28PSJG+yfpjFnmzLM1c1j73Ag+YKmIdQwIWjZxvA4xxPcGJeVoVW5PtGK1nWgbR
	jfRRbq+J10OOuhLE7a8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmRSE-008w5b-1R;
	Sat, 30 Sep 2023 04:19:46 +0000
Received: from smtp-8fa8.mail.infomaniak.ch ([83.166.143.168])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmRSB-008w58-0s
	for ath11k@lists.infradead.org;
	Sat, 30 Sep 2023 04:19:45 +0000
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4RyDWb1VRdzMq6Hs
	for <ath11k@lists.infradead.org>; Sat, 30 Sep 2023 04:19:39 +0000 (UTC)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4RyDWZ5n6fzMpp9r
	for <ath11k@lists.infradead.org>; Sat, 30 Sep 2023 06:19:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ik.me; s=20200325;
	t=1696047579; bh=DYE1rrcqS156xnODPYW76EJau30S/3a4nXjc9uVNLSE=;
	h=Date:To:From:Subject:From;
	b=ebcCHiEHUNmeLoULPGbdO9ivtn+lqT7hEfKsMqG87stF7yCOXg93ib1yjj89sCq4D
	 xLLqm0toPrFqf/YbJvzW4SmvILRYt/VQNZcnrxn+OI9X4gQ68zbqjvlC4oeT1gmyyz
	 87N0Q1stJ/JaqtCWeGboE1BxbP+gM9nfxBkUuedo=
Message-ID: <8caf5a3d-943d-f552-19be-efe82ddd351e@ik.me>
Date: Sat, 30 Sep 2023 06:19:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
To: ath11k@lists.infradead.org
Content-Language: en-US
From: Fourhundred Thecat <400thecat@ik.me>
Subject: ath11k_pci: failed to connect to HTT: -110
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_211943_455119_CF5F3FEB 
X-CRM114-Status: UNSURE (   6.00  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hello,

I have Qualcomm QCNFA765 card (Lenovo T14s gen4).
I am using custom-compiled kernel 6.1.55. I have ath11k_pci in the 
kernel, and all firmware files are loaded successfully. Yet, when 
booting, I see on the console:

ath11k_pci: Service connect timeout
ath11k_pci: failed to connect to HTT: -110
ath11k_pci: failed to start core: -110

and the network device wlan0 does not exist.

But lspci -v shows the network card, and module it is using.

and dmesg | grep ath11k

ath11k_pci: BAR 0: assigned [mem 0x90600000-0x907fffff 64bit]
ath11k_pci: enabling device (0000 -> 0002)
ath11k_pci: MSI vectors: 1
ath11k_pci: wcn6855 hw2.1
ath11k_pci: chip_id 0x12 chip_family 0xb board_id 0xff soc_id 0x400c1211
ath11k_pci: fw_version 0x11090c35 fw_build_timestamp 2022-04-18 20:23 
fw_build_id WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.9
ath11k_pci: leaving PCI ASPM disabled to avoid MHI M2 problems
ath11k_pci: failed to receive control response completion, polling..
ath11k_pci: Service connect timeout
ath11k_pci: failed to connect to HTT: -110
ath11k_pci: failed to start core: -110
ath11k_pci: ignore reset dev flags 0x4000
ath11k_pci: ignore reset dev flags 0x4000
ath11k_pci: failed to wait wlan mode request (mode 4): -110
ath11k_pci: qmi failed to send wlan mode off: -110

since I am using custom kernel, it is possible i am missing some kernel 
option. Here is my kernel config

https://ctxt.io/2/AABQk4VZEg

can somebody please tell me what is the problem ?

thank you,

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
