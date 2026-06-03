Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7FE3CD6E55
	for <ath11k@archiver.kernel.org>; Wed,  3 Jun 2026 07:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=raSHNDbgRafiNuLcsLcimsX1g+XRFdTvEE8OqtsWBtI=; b=bcBNwLU04Eed/A0foVSYSH7L/C
	wNqzeqwT4kWjYH4INGxkTkn7GROoU0tcVBmn9NvtRBDgLV2iuvXVh5AgW2QCNUzF51RRTyoIjdS/n
	ZVA99WZQm3SVLWqIDtLq226nMaexpZAPajwnfb3Uu/isoON1qpWeoolmSGkf7cHapSMQ7VkzhjXr7
	FZw6E0r4OIszn9SpN3XRMEOHllbK5CCqDfJRwRoO457r7Vr1tfg++aX15H9WC2AaHpHhwPj2tDB6e
	pmdqRRl38H7nAkqtkYvZZCdYK9sfqElvHgCN5GQOumqCLUGDqvUHwj3lBz5ARPmo4VZ/NOs+Nx4eu
	00+0PlIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfpe-0000000ESdG-1Wcc;
	Wed, 03 Jun 2026 07:16:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfpb-0000000EScj-2Ou9
	for ath11k@lists.infradead.org;
	Wed, 03 Jun 2026 07:16:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780470962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=raSHNDbgRafiNuLcsLcimsX1g+XRFdTvEE8OqtsWBtI=;
	b=dbeECehxLFShAQlK11HiXVx2lMtUwhhXWdgqqsk5cNHaeYd7x4GIcBCcIeg/Mb3pcpkklP
	LB7SE+H3jXxBaXk6RwSs21g7wmIDrugwTY0ya1UY6rg1/Pg7UjpkkNiHUCNrUlbEDHXaEc
	KHTgOX6CRQHZf0w+jouwdmFscAUG718=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-190-vfAyz7OHMXCwR1IDKYu_Tg-1; Wed,
 03 Jun 2026 03:15:58 -0400
X-MC-Unique: vfAyz7OHMXCwR1IDKYu_Tg-1
X-Mimecast-MFC-AGG-ID: vfAyz7OHMXCwR1IDKYu_Tg_1780470956
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CF94D1956050;
	Wed,  3 Jun 2026 07:15:55 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.81])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 15EFD763;
	Wed,  3 Jun 2026 07:15:49 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jeff.johnson@oss.qualcomm.com
Cc: alex@shazbot.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	bhelgaas@google.com,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	mani@kernel.org,
	mhi@lists.linux.dev
Subject: Re: [PATCH v6 2/3] PCI: Add device-specific reset for Qualcomm devices
Date: Wed,  3 Jun 2026 09:15:37 +0200
Message-ID: <20260603071547.14673-1-jtornosm@redhat.com>
In-Reply-To: <dc836218-2f18-4465-882c-c41b5289c379@oss.qualcomm.com>
References: <dc836218-2f18-4465-882c-c41b5289c379@oss.qualcomm.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: fIBBUf8tUvIxyGPsryIvgR68f7cVJHvrlJlPD0QL4fU_1780470956
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_001603_681384_D07BC790 
X-CRM114-Status: UNSURE (   5.42  )
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

Hello Jeff,

Thank you for the feedback.
I incorrectly referred to the drivers instead of the actual device names.
I'll send v7 with the corrections.

Thanks

Best regards
José Ignacio


