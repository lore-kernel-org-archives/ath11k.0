Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44180E77173
	for <ath11k@archiver.kernel.org>; Mon,  9 Dec 2024 08:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mV6ov3sFgpt7rgCC6Pvrp/3B/vFOn5GJ/ODx71pgw1c=; b=L3Dlpgohn3wOVf+hWEtkP9Pflb
	r99L6sW8jycU8NSbqopdm7DTYJIyZyW6eCQEGpoQMBPRzgiRaeiTxZMOb/dW+pC/rm+RrbxzvcBje
	kTtXZr1s3c6ndXVk1AshVe066o+778rC+aRTzZy7y3P5UplD1AVu6++YJx56KdJEyIlqWW3/ZlIwK
	UIgjuGFA015DcGDsDzeVS+YYVzjZ04oJjdMMov7amAypaILQWZV44d9QZHii+mtRhywrsCnSx/BiL
	UAq4Z6Cx2gWtvdBfRfifIalS0/TfmsQvOkR9OYwZGp8w19h7DoC8q4jJpV/odkriOWBAbEKdaOwAR
	CBKz3aHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYpD-00000006qUT-08ZZ;
	Mon, 09 Dec 2024 08:09:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYk5-00000006pAD-1gjb
	for ath11k@lists.infradead.org;
	Mon, 09 Dec 2024 08:03:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733731424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mV6ov3sFgpt7rgCC6Pvrp/3B/vFOn5GJ/ODx71pgw1c=;
	b=eOS6csRlhu4yjKUW2ysVzBCxKkvRbmpeuJjM4lHhwZGS+YEznk+1SZklx8XwgdXmtfJmAE
	qbkLv9rUeW5XrJRiK0LW8+KV0WbQyUJ67W6YwjDAuqAPcUvmBBNMmDUBcBNmWImSILaNdD
	+OgvtmCcbfUzY/Av/kUEmsg+IImMSaU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-269-TTUgGWDePXyyFS5-S_VJzQ-1; Mon,
 09 Dec 2024 03:03:41 -0500
X-MC-Unique: TTUgGWDePXyyFS5-S_VJzQ-1
X-Mimecast-MFC-AGG-ID: TTUgGWDePXyyFS5-S_VJzQ
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 906811954B39;
	Mon,  9 Dec 2024 08:03:39 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.253])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BFB03195606C;
	Mon,  9 Dec 2024 08:03:35 +0000 (UTC)
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
Date: Mon,  9 Dec 2024 09:03:34 +0100
Message-ID: <20241209080334.5989-1-jtornosm@redhat.com>
In-Reply-To: <1123551c-1a6d-4d0d-b3c7-f65c15509280@quicinc.com>
References: <1123551c-1a6d-4d0d-b3c7-f65c15509280@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_000345_528945_CF899B29 
X-CRM114-Status: UNSURE (   6.45  )
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

> So you can't up with ap type or can't up with managed interface?
Please, let's go to focus and not repeat the same, due to the reasons
that I commented before, I can't up my scenario with aps using your
proposed inteface configuration.
I am going to remark again, I can do it with the old configuration
previous to the commit f019f4dff2e4 ("wifi: ath11k: support 2 station
interfaces").
Thanks to my patch after 019f4dff2e4 ("wifi: ath11k: support 2 station
interfaces") by means of a parameter I can do it too.
And that's all.

Thanks

Best regards
Jose Ignacio


