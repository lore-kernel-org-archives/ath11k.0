Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1787AC55184
	for <ath11k@archiver.kernel.org>; Mon,  3 Aug 2026 15:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LWkOHrFhk8AsrGT8WYQGQjT9fngol3OgZMxTYxNslao=; b=rLuny58oqPCyUJvhF6JLH6vAAD
	BRm4fifhHrENWvmDzaCXiye93327EM9dGDPoK14d/OHb4ojh6JuHi4o1mL7bk8PXRGN/fbrRjVB4j
	hWmJ3yEOpgnhj5kofzitqMnB0w7cqKhPIf8GdgogE7qgpGpaPLNVTdFGNs3EtruS+qdtzQacBcjO1
	e93G3ye9N3QESmEOAxDOzbBnq1h+eD69Kg3X4fEzW1UJS+BhTzBtRHPWBg3racF8DYpcqi/srulop
	NNY+tv7LestsFUE39QE1mpAicpSlIa9rftMmmcyFEdfgOD9uoataUMpOYwYudfVp/13ElTsBxf1YJ
	I4ehc/WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquHa-0000000HTSp-0Iyr;
	Mon, 03 Aug 2026 15:08:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquHX-0000000HTRl-0NRT
	for ath11k@lists.infradead.org;
	Mon, 03 Aug 2026 15:08:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785769726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LWkOHrFhk8AsrGT8WYQGQjT9fngol3OgZMxTYxNslao=;
	b=Uwguq/VDpMJd0eRwC9/gks2pGxUO0ZbZUBwjjM06K14xl+mD1QdLUldn0iVfTgR+vwO5KL
	rfpgRwiDovy0Cn9FPVb2YSrFtczJo+obaxev7Yr0lIhNdhuDAX2ltHcvbLMQsJbpP1enhL
	7RmDPQOQllHv37YK1QhjEE/T2mhQhZA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-580-Sx1XUb1JPaGfKfg_7MaeJg-1; Mon,
 03 Aug 2026 11:08:40 -0400
X-MC-Unique: Sx1XUb1JPaGfKfg_7MaeJg-1
X-Mimecast-MFC-AGG-ID: Sx1XUb1JPaGfKfg_7MaeJg_1785769719
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7C55A195609D;
	Mon,  3 Aug 2026 15:08:39 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.107])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BF0181956087;
	Mon,  3 Aug 2026 15:08:36 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: baochen.qiang@oss.qualcomm.com
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH 2/5] wifi: ath12k: prevent scan during firmware recovery
Date: Mon,  3 Aug 2026 17:08:34 +0200
Message-ID: <20260803150835.28721-1-jtornosm@redhat.com>
In-Reply-To: <81041a09-bffe-426f-a087-f6e48de93531@oss.qualcomm.com>
References: <81041a09-bffe-426f-a087-f6e48de93531@oss.qualcomm.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: kjgTelo22b9dsuMF1yjzw3tSnpRBBhLm33ifVzsRjEM_1785769719
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_080847_195280_4E1301FD 
X-CRM114-Status: UNSURE (   5.87  )
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

It is reproducible by triggering a firmware crash while there is
an active connection — userspace immediately attempts a scan via
nl80211 while the firmware is still powering on through MHI.

I iwill also fix the radio[0] issue here for v2.

Thanks

Best regards
José Ignacio


