Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264E6CD343B
	for <ath11k@archiver.kernel.org>; Thu,  7 May 2026 07:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=szDG1yGf2JvHzzIARZ5fXBS4Y9Dri5eXAFqj1ClQZbA=; b=Gid7RriWwfgFOYHCP5DAmqXEVQ
	q5bd1XO1Av3xNmH+1nXx1YuCMt72Sx4kIuWjc5W4TW5E/lRjPvHVUil5VQDZQMlxLvdJTDag5nKxB
	9pGiTXoqNJwfvgKtPDTTKQ3SQF5cgFL0IRxqwxyNJw0rSdw8lq1Xbwi7PWRFmp4TpwzOPuKe2sC/8
	R5tbmnjssTOpJzBOHa7t86Iw2WUgeXcbMc9J6+4F9m2IWrct4KLOCrFRDi5iEpsnQUZnck1fmVTmg
	vk4WGu7bh6gNW4b6ElMch0BxKNQQLwPjORQiR81IHwj6O2kaUgoEj/AQyadOhs9ZcdACSJhBjtlmr
	Qz0+rZHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKsqO-00000002zov-0ThX;
	Thu, 07 May 2026 07:08:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKsqM-00000002zoV-451c
	for ath11k@lists.infradead.org;
	Thu, 07 May 2026 07:08:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778137700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=szDG1yGf2JvHzzIARZ5fXBS4Y9Dri5eXAFqj1ClQZbA=;
	b=hhwMlwsaNV7jENBUnR1wEA/6wnmlpXmLoQEjfc6ZR7cj41crLhn42MD0xixgCHKO2muOFK
	Dut8Gx0f5uSyTf/OqE4/QtkX5onKzSqVcwMYtGqy3zGk2F7BuTB6DIc7b4qGz5JvthUlw4
	TAl833Rz51MipGaq6pP654AsFRiYmpw=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-661-FaxXW4vKMHm-x5oZVn4pVg-1; Thu,
 07 May 2026 03:08:15 -0400
X-MC-Unique: FaxXW4vKMHm-x5oZVn4pVg-1
X-Mimecast-MFC-AGG-ID: FaxXW4vKMHm-x5oZVn4pVg_1778137694
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 51528195608F;
	Thu,  7 May 2026 07:08:14 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.69])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9EE961953947;
	Thu,  7 May 2026 07:08:10 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: rameshkumar.sundaram@oss.qualcomm.com
Cc: ath11k@lists.infradead.org,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] wifi: ath11k: fix warning when unbinding
Date: Thu,  7 May 2026 09:08:07 +0200
Message-ID: <20260507070808.367442-1-jtornosm@redhat.com>
In-Reply-To: <005af843-da19-4df9-af67-2cd148b24d62@oss.qualcomm.com>
References: <005af843-da19-4df9-af67-2cd148b24d62@oss.qualcomm.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: G3dwjRTkmXujlHgcPjFSZm3HVoI3nJZ339bPEfatU14_1778137694
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_000823_081030_3EE92490 
X-CRM114-Status: UNSURE (   9.28  )
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

Hello Rameshkumar,

The hardwre that I am using is QCNFA765, but I think it is something
related to ath11k driver and not related to some specific hardware.

I am running with the latest upstream kernel and I can reproduce it, so
I think it is not related with the problems that you comment.

Let me repeat this to try to clarify:

The easiest way to reproduce it is to run in a VM the default upstream
kernel (with this card using PCI passthrough), and since this is always
failing, just unbind the device (ath11k_pci).

The same problem was fixed by me for ath12k driver here ca68ce0d9f4b
("wifi: ath12k: fix warning when unbinding"), and I have seen the same
problem is also happening for ath11k driver.

Thanks

Best regards
José Ignacio


