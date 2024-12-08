Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7987EE77173
	for <ath11k@archiver.kernel.org>; Sun,  8 Dec 2024 12:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9k55SSvilJwIU2K6+1S00Q1l/GJx19QY0LEzQMQV8wY=; b=qSNRKyPUk6ocx1PUxO8qxDwJ7U
	ItQW8Ci1PBqb0zW5UWhEyaspiRMGkRyKL9QdSFS4PegSX7I/FFpDJAlUwQ5F9APCce2MGBbha3Rzy
	0a5bRaVMYmz2qznkt/dXfp/EJcCnYnF2JfR66AoTUcJJoX08Ocpx4vkCvDQzE0LQrTPQZL+2VKIDe
	MIc4rOgQUcl/24eviVXYmER3sqldd+0aNAWOYgsmvjUqWzNyPvA0LN2vCB7GeSI3W2KRzMyrDyl/b
	dEsfY037KnairoH0VvOLiG2Glegr4UVlqvYWJlMQL5vXKmzcs1QeQI8MsB0bjk9sZZ4alf0t5cr2L
	uFL29p3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKGAL-00000005ElR-0W2R;
	Sun, 08 Dec 2024 12:13:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKGAI-00000005Eka-3F8n
	for ath11k@lists.infradead.org;
	Sun, 08 Dec 2024 12:13:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733660012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9k55SSvilJwIU2K6+1S00Q1l/GJx19QY0LEzQMQV8wY=;
	b=T6ZXlYea99CTNHNNgEoS/hy2INr0RaXx+XIKcKeRVL/M1F/oK89MbFrqUdnSmTPQm0zAUG
	aRCamIukMt3PHD2txdnjl6o1oLZWqgc/U1iDOUQoVcR+gvYyheqbcGE/xYERRlvLGTIcqk
	09c0qNCPtY63W3hM1iQqMkaw8Qqfm70=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-530-KL5y-vUDPw6ByRwbPHd4WA-1; Sun,
 08 Dec 2024 07:13:28 -0500
X-MC-Unique: KL5y-vUDPw6ByRwbPHd4WA-1
X-Mimecast-MFC-AGG-ID: KL5y-vUDPw6ByRwbPHd4WA
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2EBA919560AB;
	Sun,  8 Dec 2024 12:13:27 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.61])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id ED13E1956095;
	Sun,  8 Dec 2024 12:13:22 +0000 (UTC)
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
Date: Sun,  8 Dec 2024 13:13:21 +0100
Message-ID: <20241208121321.9760-1-jtornosm@redhat.com>
In-Reply-To: <0f24e115-e76d-4c8a-8a1b-591a157ee78e@quicinc.com>
References: <0f24e115-e76d-4c8a-8a1b-591a157ee78e@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_041334_879174_4AD4AB57 
X-CRM114-Status: UNSURE (   5.81  )
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

>My point is that you can try setup with ap type interface,
This is what I am doing!
> now combination limits not allow up 3 inferfaces with managed interface.
Why? The limits were bigger previously.
Why cannot allow the old configuration (previous to the commit f019f4dff2e4
("wifi: ath11k: support 2 station interfaces"a))?
In another way, your proposed configuration is limited for me.

Thanks

Best regards
Jose Ignacio


