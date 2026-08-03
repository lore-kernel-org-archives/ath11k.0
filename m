Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7CDC5518F
	for <ath11k@archiver.kernel.org>; Mon,  3 Aug 2026 14:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6fLRIeuArlV8OFsJF1bxwW3+kc6bImaHGFUoBw1oG5I=; b=DGAZpe/8vV4nbT6lR2k/G6laU1
	EwzrOVUiRRpkrV2dwxG2AGZCWNgBZ8Bn/IF3LhKAOQGZOIUi8+1niKgi6tOfIM/b0I8guDuP2fBpT
	qUbHaeJQA+u3mwz2su73KfyY1Iq5W5eX+g/QNBJlqQFxVXRcgiMvtACeAKRtUmCcZ9HU/Eyj7XT26
	CC8jQP1e9HuAGlvpYkcZ8hLe6PKonUg88wR6KSMftStPhsbZO0jQFJKrialJWc7XJAWFDjlaxqK01
	EOlnuMt2IUB/PNawqsmJHuF8hBlUJeZLicM/vpVax2vdLumQciZBTlQO2//a3Ws8WmYjlhmnhvLou
	Ei+jIwHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqu65-0000000HRdh-458j;
	Mon, 03 Aug 2026 14:56:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqu64-0000000HRdC-1XcE
	for ath11k@lists.infradead.org;
	Mon, 03 Aug 2026 14:56:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785769015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6fLRIeuArlV8OFsJF1bxwW3+kc6bImaHGFUoBw1oG5I=;
	b=V49nviD1xnuHb/cVMSOGcoGk3FrzBIu+xuS51MpJMIHxiRilbDXYgCk5gUFKCAnwCWuVNX
	yA3isrjGPnHkdAA/lwDRjLTp0Dod4WP+ETC2gVM93umlzlwOx4PJP68wBwcN6P7a+myVf3
	kXL9a6hN0NEyIvasGhoaCTEt2+zl+i0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-300-p_L3XEKvNfSxGihHvfnu6g-1; Mon,
 03 Aug 2026 10:56:49 -0400
X-MC-Unique: p_L3XEKvNfSxGihHvfnu6g-1
X-Mimecast-MFC-AGG-ID: p_L3XEKvNfSxGihHvfnu6g_1785769007
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 194CF1800592;
	Mon,  3 Aug 2026 14:56:47 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.107])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 49201180049F;
	Mon,  3 Aug 2026 14:56:43 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jeff.johnson@oss.qualcomm.com
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH 0/5] wifi: ath12k: fixes to improve MLO station stability
Date: Mon,  3 Aug 2026 16:56:40 +0200
Message-ID: <20260803145641.28070-1-jtornosm@redhat.com>
In-Reply-To: <a9565939-0ff0-4672-a733-20692b9f9f26@oss.qualcomm.com>
References: <a9565939-0ff0-4672-a733-20692b9f9f26@oss.qualcomm.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: vsXmbu8ZUBjym85C1_HvZYvzQHjzHKqJ_9b3O0yw-ts_1785769007
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_075656_473729_C9E34D15 
X-CRM114-Status: UNSURE (   4.83  )
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

Ok, I will rebase onto ath/main for v2.

Thanks

Best regards
José Ignacio


