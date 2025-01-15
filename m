Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CD4C02183
	for <ath11k@archiver.kernel.org>; Wed, 15 Jan 2025 11:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hSuBcyrIiocPptm8Y5otPG1ERSmPfpYHXzYVlnWzqY8=; b=wl5QQkZF5Xbs6NaAULIUs+3sS6
	0sHLkTNoUk6qvbwHIhk7II+io3HCkEkrR0PX4BHiblItLbPPqxacTWhUAzgKbgH7XB2zzTd4XehTK
	qaLGHBJ9rM/Q7sSW9G7tE0WRh+gOOisJUmG3Rzxuy4rCtDsorv0X4M8pYa7g0IwCBYZZDfF4qfe5i
	GzJRNra44zM0NRkZTMjWZHkH1QI+t8L11WRhhZhfUMiiLt1xiBqGvV7uGvyQiaoSgvdVnepUEhoFb
	w57ZKfixSiCiBFkLsB0zCQj+5IqLrUsLU8Mbhy8WsnTsEJQQ1HBgsqlodvUV21Q+IKIFXZIKftMIz
	1l0MJrLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1EZ-0000000BbzI-1YIB;
	Wed, 15 Jan 2025 11:06:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1EI-0000000Bbwv-2Law
	for ath11k@lists.infradead.org;
	Wed, 15 Jan 2025 11:06:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736939193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hSuBcyrIiocPptm8Y5otPG1ERSmPfpYHXzYVlnWzqY8=;
	b=QRMShNI7eDkl3Cl3rpr9VznuzHDQUWh56ouGPCiRQpNbKxBBBRUbh/mLgTUacjHqsxANPM
	SCAOHAZU/UlJ0wTtsXTxq6kUiW40oSP9r3p1uXW23cYItEalArmcDyg+mTqdBygZjanJLN
	xtEVasTnxNgKYif1amzXEJAESOR0T4I=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-547-ODsRmIcUPXi4Zg68X6wMkg-1; Wed,
 15 Jan 2025 06:06:29 -0500
X-MC-Unique: ODsRmIcUPXi4Zg68X6wMkg-1
X-Mimecast-MFC-AGG-ID: ODsRmIcUPXi4Zg68X6wMkg
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3ACB01956055;
	Wed, 15 Jan 2025 11:06:28 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.171])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8769E19560AE;
	Wed, 15 Jan 2025 11:06:24 +0000 (UTC)
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
Date: Wed, 15 Jan 2025 12:06:21 +0100
Message-ID: <20250115110621.134716-1-jtornosm@redhat.com>
In-Reply-To: <1090a0e4-6a19-422f-83ad-4566e5c86015@quicinc.com>
References: <1090a0e4-6a19-422f-83ad-4566e5c86015@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_030634_668506_D9C2AFB2 
X-CRM114-Status: UNSURE (   4.56  )
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

Buff ... again the same that was already in the thread ...
As I commented, if you want to have a common interface combination, please
go ahead with yours, and then we can see on our own.

Thanks

Best regards
Jose Ignacio


