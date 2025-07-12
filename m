Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079F2C83F1A
	for <ath11k@archiver.kernel.org>; Sat, 12 Jul 2025 04:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:To:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mzTgL6KyVzLy/GJ9g3Xb3ePQiw6Ao0kqdnrFykfnWxc=; b=17GGbXaG3qu0V9PYpCuoOeW+nk
	/Ma+rH8FYZl4jI4R3oe4czrtFptftyR7dBvvGal7KWBdj8a5WVUw6I31BFvsIo5awRIOL3Asq65Od
	oMIb/P8hc6y6KqRim3qCHGJI93GYqevaaiwyoGLRsZ2Lq6Cb/StL9jwkv11DIr9Jy2MRxMzMM+SvH
	VBGBX/tX+OsrWmfmPXdfKMiHv8SQUeyazZFb007X7GbifeQZw20YPkFsEnawh+rMRk8GuBb4z0k0a
	HJ99bVv190Zg8garDVXvUC7hOKzgDL+NY/ywC9ja5VFcQILyzYQ8EoCkbL7BikMdM37FGohnadu6o
	ZfI7PEIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaS4Q-0000000GG4U-0QB2;
	Sat, 12 Jul 2025 04:42:42 +0000
Received: from smtp-bc0b.mail.infomaniak.ch ([45.157.188.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaS4N-0000000GG44-2uv1
	for ath11k@lists.infradead.org;
	Sat, 12 Jul 2025 04:42:41 +0000
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bfGCd1rb0zwhM
	for <ath11k@lists.infradead.org>; Sat, 12 Jul 2025 06:42:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ik.me; s=20200325;
	t=1752295357; bh=mzTgL6KyVzLy/GJ9g3Xb3ePQiw6Ao0kqdnrFykfnWxc=;
	h=Date:To:From:Subject:From;
	b=bfpjlZVy/PTZ8NSthd6QyRskEApP6GYjBKljQjfw7a3W5Jau/hFaAEnQ/0yz++pYu
	 bnxnPJCVrWK9yDCKjv1iX/uoYfjcdZXXwuLTxN7vd7l8n862ry2GCJqHi0Jns0jdPq
	 si1yHe5NXfK+J+3oxl0oI/T6f8BnO8MtOYPV5xWs=
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4bfGCc5pGfzcBM
	for <ath11k@lists.infradead.org>; Sat, 12 Jul 2025 06:42:36 +0200 (CEST)
Message-ID: <a6af8fab-a24e-32d3-a46c-32c569289bed@ik.me>
Date: Sat, 12 Jul 2025 06:42:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
To: ath11k@lists.infradead.org
Content-Language: en-US
From: Fourhundred Thecat <400thecat@ik.me>
Subject: Wi-Fi Breakdown (Qualcomm Wi-Fi 6E NFA725A) on Lenovo ThinkPad T14s
 Gen 4 - ath11k_pci errors
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: :39e8e9e9b322912:ham:c07166f4469634d
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_214240_017449_A981D65B 
X-CRM114-Status: UNSURE (   6.49  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

hello,

I'm experiencing a bizarre Wi-Fi issue on Lenovo ThinkPad T14s Gen 4 
(AMD Ryzen 7 PRO 7840U) with a Qualcomm Wi-Fi 6E NFA725A card (using the 
ath11k_pci driver, linux kernel 6.6).

Approximately 50% of the time I boot my laptop, the Wi-Fi connection fails.

     Initial Connection: On affected boots, wlan0 successfully obtains 
an IP address via DHCP and the network works for a few seconds.

     Sudden Breakdown: After a few seconds the network completely 
breaks. I cannot ping anything, and attempting to ifdown wlan0 results 
in long timeouts and numerous errors.

   ath11k_pci 0000:01:00.0: failed to flush transmit queue, data pkts 
pending X
   ath11k_pci 0000:01:00.0: wmi command XXX timeout
   ath11k_pci 0000:01:00.0: HW problem - can not stop rx aggregation
   ath11k_pci 0000:01:00.0: failed to send WMI_VDEV_INSTALL_KEY cmd

     Later, trying to bring the interface back up fails with Could not 
set interface wlan0 flags (UP): Resource temporarily unavailable.

Crucial Datapoint:
If the Wi-Fi works correctly after booting (i.e., this problem does not 
occur in the first 20 seconds after boot), it will continue to work 
flawlessly for hours (perhaps days). I can do as many ifdown wlan0 ; 
ifup wlan0 as I want and I will not trigger the issue.

I am using custom linux kernel 6.6.15, and here are the firmware files:

e12b23ddc4b8d2d2a10a651a5d6fdcd00f60fcae884d2cf5dad17627211fcdfd 
ath11k/WCN6855/hw2.1/amss.bin
759a2bcb3249b39c1e9a595f2559e228a1a682786c15cd1643af4a1352eb24ec 
ath11k/WCN6855/hw2.1/board-2.bin
0c590881870d0e6e98fc7d393ce05690e09287933b1b535e935bf5d98b77713f 
ath11k/WCN6855/hw2.1/m3.bin
e1b774b1feda4cab01f5a26089124059539fc31544ac34129dce45c8ff26d645 
ath11k/WCN6855/hw2.1/regdb.bin
d67150c8925a98a4783c2c9a3e652b5a21fcdf8119875e1d2860c7c180fa98f8 
regulatory.db
704ba48e3b12a28d3ed9411e526f127870201ba5007ee0c17ae92dafe2444fa5 
regulatory.db.p7s



