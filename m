Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78937E7717D
	for <ath11k@archiver.kernel.org>; Wed, 11 Dec 2024 17:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qXu8dTjdB54vg2eNS9OB9yQqJWpu/QszOFjUbU7yuXI=; b=08xzYfTFhfJm9LvFgel7O96sP0
	F9s+Fd/hoXYU4xqy9C7ZjWob6i3bHNd4ZAcRn3jbWgTfN+N6eE9i/UgzDvhBVKdgHwrMczCAUHzks
	ew/oE5Ppz+V3CekK22UjjpPeLj/PJN2KnBAzF5g4hsX/yhzZMprj054k0TNn0Agi2CTct+gSyYWzj
	szw1PWuuMZVdcldD8v2OjjNogxIQc+04cYwM7Ea7PmKp3MA2Las8mK7rGQmtyt/eN6HMTcVB3QDYL
	B2zsIudEhulgFmhuCzLHCNDh9YgLr+ywGlHUubZEMjVd11UFsLOZ9jFiqfKyjmemp+yNGn30aqkuM
	oz1V2LrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLQiw-0000000FdpN-1DoP;
	Wed, 11 Dec 2024 17:42:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLQiu-0000000Fdok-1XBb
	for ath11k@lists.infradead.org;
	Wed, 11 Dec 2024 17:42:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733938926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qXu8dTjdB54vg2eNS9OB9yQqJWpu/QszOFjUbU7yuXI=;
	b=bmX054zXFU9f+vJgJfE/h9WS30fZs9LPw/T9R8eXUKSyBJhlng/YQc3Awfo/xyKc/2KLZ2
	mDbqzGtTHT7mpE8Mvi5JoAgiV29LGdS0F3KbPheQ4gUhOPCmYmfsL8v44FTPxcbCJo6e8t
	IkTHIl19EWNmy13xnJeSKEmI7L5wTfc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-313-uJzm67B0MeOQ3jz9N9ZhFA-1; Wed,
 11 Dec 2024 12:42:03 -0500
X-MC-Unique: uJzm67B0MeOQ3jz9N9ZhFA-1
X-Mimecast-MFC-AGG-ID: uJzm67B0MeOQ3jz9N9ZhFA
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D1BD71955F28;
	Wed, 11 Dec 2024 17:42:01 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.126])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 202C719560AA;
	Wed, 11 Dec 2024 17:41:56 +0000 (UTC)
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
Date: Wed, 11 Dec 2024 18:41:55 +0100
Message-ID: <20241211174155.30782-1-jtornosm@redhat.com>
In-Reply-To: <d8705140-e335-47e0-ac70-47d8592fb18c@quicinc.com>
References: <d8705140-e335-47e0-ac70-47d8592fb18c@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_094208_471798_FD75FFFC 
X-CRM114-Status: UNSURE (   7.37  )
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

> Got it, you use Networkmanager, so that the add interface type will
> always be managed. But it's still work fine in my device that I use
> "hostapd hostapd2.conf" to up the second ap.
Yes, it works for you because you don't have a manager and/or your initial
situation was clean and/or without other needs/services.

For us it was enough to be able to come back to the initial interface
combination, but it seems that you prefer to have a common configuration
for everything.
So, since I think it is your final intention, please, go ahead with your
proposed interface combination and then I will debug myself to try complete
and/or reuse in some way.

Thanks

Best regards
Jose Ignacio


