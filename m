Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C9F1C02180
	for <ath11k@archiver.kernel.org>; Wed, 15 Jan 2025 13:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BIPi0LYR4jbUUm2a/97wNZOq6LKVgEAqIZ8/607KDYQ=; b=H6G0vOOeOWQWo6pPlgYy/TlawJ
	MWKp7keIXJcX3HXGltI3dwwRCD6nTImlM6BRQsmujwBKQcVIAO+2s1GANXtsqV99ZKMomAsNKgGp5
	lnW2mHuCKQcCK0C/mPmQ6QwdkhvZMiLHK5TAEgMvYoxquqdIgTDQkQPPHWTuLXmaBqQa82YyMOZcy
	HqQBZjOTl5yTPMFDd9ZoonSlKaE0nIQ5WzE7RKFRMMGtgpjb6iKEYjZTonaWYmvgqef+Lzo2HNSPq
	3qREsVX9BGnSc+GnVEediwjm2i4IFMfbYPyNnNqLoT214jHYkq5MLnXSEqHxA70YqBmtKeIXAQi0t
	IYRhu4Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY35N-0000000BvUF-0WL7;
	Wed, 15 Jan 2025 13:05:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY346-0000000BvGm-34UB
	for ath11k@lists.infradead.org;
	Wed, 15 Jan 2025 13:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736946249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BIPi0LYR4jbUUm2a/97wNZOq6LKVgEAqIZ8/607KDYQ=;
	b=I6oaixEvRjahjyBdCwXDgUm16Uq+1oHBCM0XvuKN/T0ui9E0ZYGS8LWQsROzkJA2IZOA7H
	+cRWnM80CjsapPtP0JeS4kj1WvzZr7JKxz1ZAxrTfwMfgIH1m0XXyfdFfWGnum7XkYHqmV
	8FMPA+XiV9FJlTfsLI5HyTJRTQdumfE=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-404-WqJCVVQ5PvuGuwyK2Q3izQ-1; Wed,
 15 Jan 2025 08:04:06 -0500
X-MC-Unique: WqJCVVQ5PvuGuwyK2Q3izQ-1
X-Mimecast-MFC-AGG-ID: WqJCVVQ5PvuGuwyK2Q3izQ
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6EE321978CA2;
	Wed, 15 Jan 2025 13:04:04 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.171])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C084919560A3;
	Wed, 15 Jan 2025 13:04:00 +0000 (UTC)
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
Date: Wed, 15 Jan 2025 14:03:59 +0100
Message-ID: <20250115130359.138890-1-jtornosm@redhat.com>
In-Reply-To: <d410576f-2fc7-4de1-af51-29fbe8b14948@quicinc.com>
References: <d410576f-2fc7-4de1-af51-29fbe8b14948@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_050410_843287_678ABE7B 
X-CRM114-Status: UNSURE (   5.06  )
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

Thank you for the information.
My platform, as you said, is just wcn6855 hw2.1, but using NetworkManager
with the default configuration.
If this is the only stopper, you can skip and not consider as a wrong case,
because (sorry for repeating) it is just a matter of the number of available
resources that can be adjusted after some research from us.

Thanks

Best regards
Jose Ignacio


