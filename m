Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8EFC02180
	for <ath11k@archiver.kernel.org>; Wed, 15 Jan 2025 11:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5WZ3HqHzhCeXbjJNpUFTds2GJZaGaXWIORjllCaEmy4=; b=iJ/bsmVzjxFsnY615FNk34T+SO
	CjlIsMTIsYcVar3KptsShwKD22u3buml0pO5QtDHduY8sJXaiiN0E2piyZJHJDzBMtsBtkMXvbMft
	ry5em0Q97oCG+oRsD36w8MY7DziHSTly/fnsgQkpGzgbjvbe88xz1fuG4nBbyJUWDZUHQBqGadzjk
	NBS332PwlgkJ2QPgxQgkStKrvuxngKCAtzPyiKl7ildGbd9c8kO7pivsUlC0YrLNuwi4ACVekQwwL
	0+8GenuElBW+mnQ8iu4SSgtpcUXmjmFYxz0Io6G+Q8zagIc+MR+El184VLafu9Un//ORvVMrDD7+V
	ZqKI3JJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY21A-0000000BmIs-3qR1;
	Wed, 15 Jan 2025 11:57:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY217-0000000BmIX-49WE
	for ath11k@lists.infradead.org;
	Wed, 15 Jan 2025 11:57:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736942221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5WZ3HqHzhCeXbjJNpUFTds2GJZaGaXWIORjllCaEmy4=;
	b=KGNV0wpyQ3xlZGOt4t6Q77yQvsBxiHK+3MGMJC5LuifvaetY0S60ohHUK/x/v/qH2lB6Ay
	8Xvm12aoiI2sG2aTcDJMtSOQfd0Myu/PsZzQdFlW0tg9KW5zgcpYKVPV7Ad48p7aImj1qz
	nzbRG52EwIr/NR54E7UWHiLnoK5QRD8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-541-MVFhiMHMP4ecDAVoAD_tyg-1; Wed,
 15 Jan 2025 06:55:07 -0500
X-MC-Unique: MVFhiMHMP4ecDAVoAD_tyg-1
X-Mimecast-MFC-AGG-ID: MVFhiMHMP4ecDAVoAD_tyg
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1F0871955F67;
	Wed, 15 Jan 2025 11:55:06 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.171])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9B8CC19560A3;
	Wed, 15 Jan 2025 11:55:02 +0000 (UTC)
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
Date: Wed, 15 Jan 2025 12:55:00 +0100
Message-ID: <20250115115500.136864-1-jtornosm@redhat.com>
In-Reply-To: <4ef22e4e-1ef8-4c16-ae01-06adf23415f8@quicinc.com>
References: <4ef22e4e-1ef8-4c16-ae01-06adf23415f8@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_035702_152176_5D4F202D 
X-CRM114-Status: UNSURE (   4.36  )
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

Hello Yuriy,

It is just a matter of the number of resoruces available.
But before any further investigation/adjustment from us, I would like to
confirm that your interface combination is what it is going to be used
(I haven't seen it in ath/wireless/wireless-next/...).
Are you going to proceed with that? 

Thanks

Best regards
Jose Ignacio


