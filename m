Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445BD60A2617
	for <ath11k@archiver.kernel.org>; Wed, 21 Oct 2026 06:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tQGwOBX+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=NEdU7xbF;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Y1Ya8eVF;
	dkim=neutral header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Y1Ya8eVF;
	dkim=neutral header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Y1Ya8eVF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bPNcZtx1R86/TZx74cw8XerrcoFLwDH2DF9j2lH9uns=; b=tQGwOBX+mvdd8DxQ2sP/Cknz+o
	n3rQ9EO2YSZFhMzZND26ffHbl+Ldu7zOapHA37afg5DT6qA55w+t7BCu4tEfvY3pA9qTWld/DCdgg
	9fv7wV6aWnT4FALcNqNeCKvYdbUBy6Phccx8UBgYNwq2C0qJmxI3NIywwVBoGiHrLxPA1Yq1KKAfZ
	KHf+Os7xq+i386pFWYDygZiOrLSVeLkbQMxhHiRNchrHN7q2rxqD0JedzQxFViJGqB6qiDZtjL3ZU
	lfUb5zWjid64Di5WUE8P6WZpirnkyI6FLPPV5o5HCjcuV3ecTjuQIqtCxjmP6hJ+WqaOBtIzJClOR
	JdZ6+JBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJPUN-0000000B8NI-3zGQ;
	Wed, 21 Oct 2026 06:07:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJPUM-0000000B8LJ-31SR
	for ath11k@bombadil.infradead.org;
	Wed, 21 Oct 2026 06:07:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=bPNcZtx1R86/TZx74cw8XerrcoFLwDH2DF9j2lH9uns=; b=NEdU7xbFBH98hTpDLjJh0XhS8y
	NM5A3lS+sdnbbGixSTCOlZqU2EuVGdgsv134O9snHuZm4lZii+8oebEhd5WoY3g0zlXt1Uosmg4r/
	KUpaJnCoaeAnqzTuCzlM1xglP266kLvP6TwYROTFpvqrMPXJK5H4pwTbU1dj7rIdhpm9ldHyeV1oI
	F9TsZaQaXYSGbYK7r/S8sSSm6BnSxBNzoCa5Drxmf3EGEoVeGI+e2LBppzIgFzf9yMDp5SGnCjpq9
	rWGm3l+otEwGbxErLQE4EZFdKpBV3iDNhlCjIU0QJLcXNg4tcyPSJESzW88Yh1AIJB5gWIKeHUys6
	7WD8ucAg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJPUJ-00000005Udj-1kW3
	for ath11k@lists.infradead.org;
	Wed, 21 Oct 2026 06:07:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792562866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bPNcZtx1R86/TZx74cw8XerrcoFLwDH2DF9j2lH9uns=;
	b=Y1Ya8eVF0ljq+GZ7V9DfmqYEQWkGkCvzLegghAq1SjoZijrgunjeUVQt5X+wS1wuBMKKkp
	caRE+AaS9LmnJMo+nEQ0dcdbp9Ztzj6GhaogwNRsAaCqkM07XelAfP/4CP/tu9teeB67CU
	MX+7FwH7874uStojs3PY/o5vIAHg5As=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792562866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bPNcZtx1R86/TZx74cw8XerrcoFLwDH2DF9j2lH9uns=;
	b=Y1Ya8eVF0ljq+GZ7V9DfmqYEQWkGkCvzLegghAq1SjoZijrgunjeUVQt5X+wS1wuBMKKkp
	caRE+AaS9LmnJMo+nEQ0dcdbp9Ztzj6GhaogwNRsAaCqkM07XelAfP/4CP/tu9teeB67CU
	MX+7FwH7874uStojs3PY/o5vIAHg5As=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792562866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bPNcZtx1R86/TZx74cw8XerrcoFLwDH2DF9j2lH9uns=;
	b=Y1Ya8eVF0ljq+GZ7V9DfmqYEQWkGkCvzLegghAq1SjoZijrgunjeUVQt5X+wS1wuBMKKkp
	caRE+AaS9LmnJMo+nEQ0dcdbp9Ztzj6GhaogwNRsAaCqkM07XelAfP/4CP/tu9teeB67CU
	MX+7FwH7874uStojs3PY/o5vIAHg5As=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-494-BX9fNg00Pkqep9e7R1Z5fg-1; Wed,
 21 Oct 2026 06:07:40 +0000
X-MC-Unique: BX9fNg00Pkqep9e7R1Z5fg-1
X-Mimecast-MFC-AGG-ID: BX9fNg00Pkqep9e7R1Z5fg_1792562859
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 348BF180057A;
	Wed, 21 Oct 2026 06:07:38 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E97CE30000E3;
	Wed, 21 Oct 2026 06:07:35 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jjohnson@kernel.org
Cc: tamizh.raja@oss.qualcomm.com,
	julius@bairaktaris.de,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH v8 1/2] wifi: ath11k: use queue mapping for WCN6750 ring selection
Date: Wed, 21 Oct 2026 08:07:23 +0200
Message-ID: <20261021060725.242681-2-jtornosm@redhat.com>
In-Reply-To: <20261021060725.242681-1-jtornosm@redhat.com>
References: <20261021060725.242681-1-jtornosm@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: N_FDHm8v_EMXONOZDNUKDetCIJufuxeGfAgUy6DBhgo_1792562859
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_070747_805338_1EA633FC 
X-CRM114-Status: GOOD (  16.33  )
X-Spam-Score: -0.2 (/)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

WCN6750 selects the TCL ring using skb_get_hash() to distribute
flows across its 3 TX rings, as introduced in commit 7636c9a6e7d7
("wifi: ath11k: Add multi TX ring support for WCN6750"). The goal
was to prevent out-of-order packet delivery that could occur with
smp_processor_id()-based selection, where packets of the same flow
could end up on different rings depending on CPU scheduling.

Switch to skb_get_queue_mapping() instead, which returns the AC
(access category) assigned by mac80211 in ieee80211_select_queue().
This provides the same ordering guarantee: packets of the same TID
always map to the same AC and therefore always land on the same
ring, preventing reordering.

Using queue mapping for ring selection also provides QoS-aware
distribution, where each traffic class gets a deterministic ring
assignment, rather than the random distribution that flow hashing
produces. With 3 rings and 4 ACs (VO=0, VI=1, BE=2, BK=3), the
mapping becomes: VO and BK share ring 0, VI uses ring 1, and BE
uses ring 2.

This matches the approach already used by ath12k for WCN7850, which
has the same ring count and uses skb_get_queue_mapping() for its
ring selector.

This change also removes the dependency on skb_get_hash(), which
is relevant for a subsequent patch that removes the skb parameter
from the get_ring_selector hw_ops callback entirely, enabling
TX flow control in wake_tx_queue without requiring a complex peek
to inspect frames before dequeue.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Tested-by: Julius Bairaktaris <julius@bairaktaris.de> # IPQ8074 WLAN.HK.2.9.0.1-02146
---
v8: Split ath11k and ath12k into separate series to avoid conflict
    with Julius's airtime queue limits series (ath11k only) and help to
    unblock both
    No code changes from v7
v7: https://lore.kernel.org/all/20260917064825.12747-2-jtornosm@redhat.com/ 

 drivers/net/wireless/ath/ath11k/hw.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
index 93f9a03c48dc..d679e39dce03 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -891,13 +891,7 @@ static u32 ath11k_hw_ipq8074_get_tcl_ring_selector(struct sk_buff *skb)
 
 static u32 ath11k_hw_wcn6750_get_tcl_ring_selector(struct sk_buff *skb)
 {
-	/* Select the TCL ring based on the flow hash of the SKB instead
-	 * of CPU ID. Since applications pumping the traffic can be scheduled
-	 * on multiple CPUs, there is a chance that packets of the same flow
-	 * could end on different TCL rings, this could sometimes results in
-	 * an out of order arrival of the packets at the receiver.
-	 */
-	return skb_get_hash(skb);
+	return skb_get_queue_mapping(skb);
 }
 
 const struct ath11k_hw_ops ipq8074_ops = {
-- 
2.54.0


