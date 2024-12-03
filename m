Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25EA4D4979A
	for <ath11k@archiver.kernel.org>; Tue,  3 Dec 2024 10:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HcYFnzD/H6bLNbir/uAcZ0RGwnpWZLD70cC/6A5H/H4=; b=a3OWXb7CAO+FElyUYoXle6Ctpf
	V5P5xMEG7U4JCM5jJbKV2eJBq1F7PmkJDJs1ya3xEY1x5p2mxBl5gdKHawzn7GyWyRh2ta4mtzE/i
	QPQy/QdgMjulvCmeohl53nr4oU9MyZG4YXmZe17hxZjuKrOiztMLt04sRaQl/sNDzguCawmDZX+6f
	nhcls8pjPS8otPqX5eOqkBvJwhYu5cbEd9PHIfxMMtS4Ow1rMxjEFNjzT5M94RFQUce5zXexRkI0K
	uOJ7/nRjtzJaHCAIopnYm2UyD41F3cdYN7x2ST3QeiQiPGLrDwA63jUuSq9sU8XTqzZvrUn+v9XO0
	NhY9SmbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPi4-000000090OR-2sb6;
	Tue, 03 Dec 2024 10:00:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPWC-00000008y1b-0fZ7
	for ath11k@lists.infradead.org;
	Tue, 03 Dec 2024 09:48:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733219310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HcYFnzD/H6bLNbir/uAcZ0RGwnpWZLD70cC/6A5H/H4=;
	b=KUz514l0oHntJvbiJoXIh9D0McZx2Q2KMJPThmdLnRAGURL82ViMQPqviy/iuzE23KP6Fa
	82D3iPPxny8QTq1l2javg7x7hFeCN4wBNaTg1949jLxy0RoZBAdUUu+dn9Xba3XjWNUP/b
	OkRcd0Is92s2ceoy2irx1cJXGFBLi0I=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-425-kQl09MV-NZCdcB4ktD1TqA-1; Tue,
 03 Dec 2024 04:48:27 -0500
X-MC-Unique: kQl09MV-NZCdcB4ktD1TqA-1
X-Mimecast-MFC-AGG-ID: kQl09MV-NZCdcB4ktD1TqA
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4C28B1955F43;
	Tue,  3 Dec 2024 09:48:26 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.136])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0D4621956063;
	Tue,  3 Dec 2024 09:48:21 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: quic_yuzha@quicinc.com
Cc: ath11k@lists.infradead.org,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	quic_cjhuang@quicinc.com,
	vbenes@redhat.com
Subject: Re: [PATCH] wifi: ath11k: allow APs combination when dual stations are supported
Date: Tue,  3 Dec 2024 10:48:20 +0100
Message-ID: <20241203094820.106225-1-jtornosm@redhat.com>
In-Reply-To: <20bf2693-ce53-48e9-8b54-7e3273815033@quicinc.com>
References: <20bf2693-ce53-48e9-8b54-7e3273815033@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_014832_267281_D3E90004 
X-CRM114-Status: UNSURE (   7.37  )
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

> Which chip do you use?
Since I am not totally sure about the useful information, let me show you
the kernel logs:
$ dmesg | grep ath11k 
[    3.659388] ath11k_pci 0000:01:00.0: BAR 0 [mem 0x84200000-0x843fffff 64bit]: assigned
[    3.659405] ath11k_pci 0000:01:00.0: enabling device (0000 -> 0002)
[    3.659649] ath11k_pci 0000:01:00.0: MSI vectors: 32
[    3.659653] ath11k_pci 0000:01:00.0: wcn6855 hw2.1
[    4.871571] ath11k_pci 0000:01:00.0: chip_id 0x2 chip_family 0xb board_id 0xff soc_id 0x400c0210
[    4.871586] ath11k_pci 0000:01:00.0: fw_version 0x11088c35 fw_build_timestamp 2024-04-17 08:34 fw_build_id WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
[    5.241485] ath11k_pci 0000:01:00.0 wlp1s0: renamed from wlan0

If I try to setup 2 APs with your interface combination I get this:
# iw list | grep -A6 "valid interface combinations:"
	valid interface combinations:
		 * #{ managed } <= 2, #{ AP, P2P-client, P2P-GO } <= 16, #{ P2P-device } <= 1,
		   total <= 16, #channels <= 1, STA/AP BI must match, radar detect widths: { 20 MHz (no HT), 20 MHz, 40 MHz, 80 MHz, 80+80 MHz, 160 MHz }

		 * #{ managed } <= 2, #{ AP, P2P-client, P2P-GO } <= 16, #{ P2P-device } <= 1,
		   total <= 3, #channels <= 2, STA/AP BI must match
	HT Capability overrides:
# iw dev
phy#0
	Interface wlp1s0_1
		ifindex 6
		wdev 0x4
		addr a2:42:d2:1e:89:a3
		type managed
		txpower 16.00 dBm
		multicast TXQ:
			qsz-byt	qsz-pkt	flows	drops	marks	overlmt	hashcol	tx-bytes	tx-packets
			0	0	0	0	0	0	0	0		0
	Interface wlp1s0_0
		ifindex 5
		wdev 0x3
		addr 52:e9:be:33:6a:61
		ssid test-qe-wpa2-psk
		type AP
		channel 13 (2472 MHz), width: 20 MHz, center1: 2472 MHz
		txpower 14.00 dBm
		multicast TXQ:
			qsz-byt	qsz-pkt	flows	drops	marks	overlmt	hashcol	tx-bytes	tx-packets
			0	0	0	0	0	0	0	0		0
	Interface wlp1s0
		ifindex 3
		wdev 0x1
		addr c8:94:02:b5:fe:fb
		type managed
		txpower 16.00 dBm
		multicast TXQ:
			qsz-byt	qsz-pkt	flows	drops	marks	overlmt	hashcol	tx-bytes	tx-packets
			0	0	0	0	0	0	0	0		0
Or even this with no AP up:
# iw dev
phy#0
	Interface wlp1s0_1
		ifindex 6
		wdev 0x4
		addr ca:e5:84:22:10:ec
		type managed
		txpower 16.00 dBm
		multicast TXQ:
			qsz-byt	qsz-pkt	flows	drops	marks	overlmt	hashcol	tx-bytes	tx-packets
			0	0	0	0	0	0	0	0		0
	Interface wlp1s0_0
		ifindex 5
		wdev 0x3
		addr 9e:4e:c5:ea:4c:e9
		type AP
		txpower 16.00 dBm
		multicast TXQ:
			qsz-byt	qsz-pkt	flows	drops	marks	overlmt	hashcol	tx-bytes	tx-packets
			0	0	0	0	0	0	0	0		0
	Interface wlp1s0
		ifindex 3
		wdev 0x1
		addr c8:94:02:b5:fe:fb
		type managed
		txpower 16.00 dBm
		multicast TXQ:
			qsz-byt	qsz-pkt	flows	drops	marks	overlmt	hashcol	tx-bytes	tx-packets
			0	0	0	0	0	0	0	0		0

If I use the parameter to ignore the feature and configure the interface combination as before:
# iw list | grep -A4 "valid interface combinations:"
	valid interface combinations:
		 * #{ managed } <= 1, #{ AP, P2P-client, P2P-GO } <= 16, #{ P2P-device } <= 1,
		   total <= 16, #channels <= 1, STA/AP BI must match, radar detect widths: { 20 MHz (no HT), 20 MHz, 40 MHz, 80 MHz }

	HT Capability overrides:
# iw dev
phy#1
	Interface wlp1s0_1
		ifindex 7
		wdev 0x100000004
		addr 82:90:89:90:c1:37
		ssid test-qe-wpa3-psk
		type AP
		channel 13 (2472 MHz), width: 20 MHz, center1: 2472 MHz
		txpower 16.00 dBm
		multicast TXQ:
			qsz-byt	qsz-pkt	flows	drops	marks	overlmt	hashcol	tx-bytes	tx-packets
			0	0	0	0	0	0	0	0		0
	Interface wlp1s0_0
		ifindex 6
		wdev 0x100000003
		addr 6a:ef:d0:db:10:f0
		ssid test-qe-wpa2-psk
		type AP
		channel 13 (2472 MHz), width: 20 MHz, center1: 2472 MHz
		txpower 16.00 dBm
		multicast TXQ:
			qsz-byt	qsz-pkt	flows	drops	marks	overlmt	hashcol	tx-bytes	tx-packets
			0	0	0	0	0	0	0	0		0
	Interface wlp1s0
		ifindex 4
		wdev 0x100000001
		addr c8:94:02:b5:fe:fb
		type managed
		txpower 16.00 dBm
		multicast TXQ:
			qsz-byt	qsz-pkt	flows	drops	marks	overlmt	hashcol	tx-bytes	tx-packets
			0	0	0	0	0	0	0	0		0

Thanks

Best regards
Jose Ignacio


