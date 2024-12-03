Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D76E74AC2
	for <ath11k@archiver.kernel.org>; Tue,  3 Dec 2024 16:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5mYdcOoxeqZZGRp6kvkCtVM0EbJxxztYUGd4BIrXpSc=; b=hkBAQKlMSQzB1UG5SVoRQA1szp
	9kl0aL7/bcs5JKcohmx9aWTsMpFDiiDTrdlPhClhNmE0FklzJZTvP/SQcEfZDzkjPzxz983g6R5nn
	vNnaiXlmSsAKQO/BiOgn/rQMYzGgBXqWPnqI6ObiENZWMhK0NIqBQXRhGG/ze0olu7qySWQa6EABo
	hJ5bxvG4jzyAMUBENNDznaqdnhSAo9XQMB34/MiYS4MEE0DsIUBeULMRdlKNANQDcMEuGYsGQqUlD
	rez226dQA0roo6vuycobf/+nrnhTw9VfmDS72N8u4dLXNWAVwDoCAGbaAEXaFJPeCZQX+1WEQKjwH
	y8MZvjaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIVqm-0000000A6wH-2GqW;
	Tue, 03 Dec 2024 16:34:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIVqk-0000000A6vE-0KBf
	for ath11k@lists.infradead.org;
	Tue, 03 Dec 2024 16:34:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733243649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5mYdcOoxeqZZGRp6kvkCtVM0EbJxxztYUGd4BIrXpSc=;
	b=AzBZYFBJ4flhlj76u2h2Rhw5wffsfSCxSLz9V+Csgra1GL444hbLE6+2hQ/2kh9smfRzr+
	rAkkVDli84zCsxNIGLgbfSKql4IFHdByZTiggbAps1xJ+L9QC1c6Nr0ixZW/Gc/x8CWGqy
	tWVEueXbe24y5tPU881r92h3ldsA2Sg=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-561-Jk__6YEwMoOD-Q4DlTyP-Q-1; Tue,
 03 Dec 2024 11:34:05 -0500
X-MC-Unique: Jk__6YEwMoOD-Q4DlTyP-Q-1
X-Mimecast-MFC-AGG-ID: Jk__6YEwMoOD-Q4DlTyP-Q
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 35A7A1958B0D;
	Tue,  3 Dec 2024 16:34:04 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.136])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B4F161956054;
	Tue,  3 Dec 2024 16:34:00 +0000 (UTC)
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
Date: Tue,  3 Dec 2024 17:33:59 +0100
Message-ID: <20241203163359.129185-1-jtornosm@redhat.com>
In-Reply-To: <99359cc4-2279-4a8a-80a1-d5475fd5208d@quicinc.com>
References: <99359cc4-2279-4a8a-80a1-d5475fd5208d@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_083410_206055_01210837 
X-CRM114-Status: GOOD (  12.49  )
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

> And you want setup sta + sap + sap, right?
Your proposed interface combination fails as well for me if I am just
setting 2APs.
> When up the second sap will meet error? Could you pls share the error
> logs?
This is the log that is appearing:
[   61.909165] 8021q: 802.1Q VLAN Support v1.8
[   62.227530] ath11k_pci 0000:01:00.0: failed to create vdev 3, reached max vdev limit 3
It is appearing after configuring both APs when only one AP is up and when
both are down (see my previous 'iw dev' outputs).

> I'm not very sure if you add all interface with managed type, and do
> "ifconfig xxx up" before running hostapd.
Yes, I am setting the link up before running hostapd.
>You can try add second and third interface with
> "iw dev xx interface add xx type __ap".
And yes, I am doing like that for both APs.
Please, take into account that everything is working with the old interface
configuration and when it is set with the parameter (no error log), but it
is not working for me with your interface combination.
Have you tried with 2.4GHz band?

Thanks

Best regards
Jose Ignacio


