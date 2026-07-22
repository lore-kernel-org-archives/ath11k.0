Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60ED6C44532
	for <ath11k@archiver.kernel.org>; Wed, 22 Jul 2026 17:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzfSmIMBg5Zu645nMhfIQg3Rlp0CR4eLtJ/201cLgiE=; b=INx/ONwpT4dobSYIR/xshiQIQj
	1GMwcL0HI6HcBhmcv8TMP4XdbMz9NBCzIjrNB9U3J+Ni3fJpd/E4KI0uknGuT1o07x1k8PROY7fDl
	mD/vqo69Tdhu5YDrKZfGaQbwygRBiFpb2hMLhrDTr9wA6RIJswsd8D34D7DKbZcPqTtsR4tGvG/3m
	RPGldUZgwesq3U36XUuhjy4hnc4wRR6i9/9jA4NiLVbn6LyZIzvBk0SpIo6CDo0W/Ak42q1vEDfRW
	pe9HbS9HHlSH15JrTK+Kh712jyJobYtdu4t6BCBXo/pZ9hnSZDFzlyRodBXZwuQkWrhHj8nKBXG7t
	L+Q2Pi7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmaTx-0000000CQNR-0BvN;
	Wed, 22 Jul 2026 17:11:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmaTt-0000000CQME-1ruu
	for ath11k@lists.infradead.org;
	Wed, 22 Jul 2026 17:11:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784740300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RzfSmIMBg5Zu645nMhfIQg3Rlp0CR4eLtJ/201cLgiE=;
	b=QLE8FPkUqu3v27f73+2QeJGwOixWSwVYdaM3Fd09CWJf45CBUqCCdl6PF4l+/8yNeN/JiG
	A65HDZ1X71mT8/WdUpWpdgEBvEzwxY0KeLVCVk6LakDmh3ScpB5jM1nqFUTga4FSByOyRZ
	tsLaJyADvMkHaC6mia8BDuqGJASEVus=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-467-T1iGTCcONxicw4fmm9AFNw-1; Wed,
 22 Jul 2026 13:11:38 -0400
X-MC-Unique: T1iGTCcONxicw4fmm9AFNw-1
X-Mimecast-MFC-AGG-ID: T1iGTCcONxicw4fmm9AFNw_1784740297
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1E3091805F0D;
	Wed, 22 Jul 2026 17:11:36 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.27])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D166D3004181;
	Wed, 22 Jul 2026 17:11:32 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: johannes@sipsolutions.net
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH v3 1/3] wifi: mac80211: add ieee80211_tx_peek API
Date: Wed, 22 Jul 2026 19:11:28 +0200
Message-ID: <20260722171131.262239-1-jtornosm@redhat.com>
In-Reply-To: <c913114343692dd201da3af8f05fe1bc356702a8.camel@sipsolutions.net>
References: <c913114343692dd201da3af8f05fe1bc356702a8.camel@sipsolutions.net>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: 8yhfHib9dmNPyHiu9z_6cn_QXM2Nz4x4TzzAdA2z_lM_1784740297
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_101141_550845_FB9D57EF 
X-CRM114-Status: UNSURE (   6.50  )
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

Hi Johannes

Thank you for the review.
I already had some concerns about the peek approach during development, as
it was difficult to implement cleanly.
Your feedback confirms those doubts, so I am reworking the implementation
to avoid the peek API entirely.
I will send a v4 with the new approach.

Best regards
José Ignacio


