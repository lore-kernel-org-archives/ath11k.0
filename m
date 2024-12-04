Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EF3E7716D
	for <ath11k@archiver.kernel.org>; Wed,  4 Dec 2024 08:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VU0p7473Kxk8dX8CycfIbfQFmNXYGBcxy+YYaXHc62w=; b=zPMoeT8091KU/tp6+0ypY45D/J
	tq3oGwlXEgNaDDqbmAc6ppbUDQqtP6UnqGVnTBQ5yyvoDgjdsYS/SuAmv2nlS5yypxED2sIETAZB6
	CK20wI8SxbqYmxBgjed0FvaCuGPc9oU3V++/PxfiiOkFRDIu9V48lLzofUVr0WzaZfPyK0+iYBf9i
	7Jnvn4yPsCGRQMuuMmJ8Z3arzPcz9tWSKIJOxfqIm1hJN62dp7/pIkYOVk/EahDjpWjs/IXi89UXy
	sCfmPriTDsJboZ/O64yUEeIGzwMaguavJfAvButlLQbOGC9BDtVPdDQM7YBqsK+kjNjrv11vU8rXA
	oAqXY9GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIkmc-0000000BtFM-1jtv;
	Wed, 04 Dec 2024 08:30:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIkma-0000000BtEw-2l73
	for ath11k@lists.infradead.org;
	Wed, 04 Dec 2024 08:30:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733301050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VU0p7473Kxk8dX8CycfIbfQFmNXYGBcxy+YYaXHc62w=;
	b=fhfhkLmesAegukQ/YO3WYz9u0PHer0eaIZHatLdJhw4EGBBJ0rRTrXWKCDlRHwOiVd4tjL
	XcxCcfPOpoNIq40gBbyWv8BR5vOAJpSh4HXIoUVWvvKjIFi+yoG0tDljPTlIVd3rYhkgaa
	Y5V691KztCsSh383Fyh1RPv0tX2N0z0=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-433-fP7OCzLEPg2j_Yh0bPz4cQ-1; Wed,
 04 Dec 2024 03:30:45 -0500
X-MC-Unique: fP7OCzLEPg2j_Yh0bPz4cQ-1
X-Mimecast-MFC-AGG-ID: fP7OCzLEPg2j_Yh0bPz4cQ
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8C3931955F3C;
	Wed,  4 Dec 2024 08:30:44 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.181])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 29B1619560A7;
	Wed,  4 Dec 2024 08:30:40 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jtornosm@redhat.com
Cc: ath11k@lists.infradead.org,
	jjohnson@kernel.org,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	quic_cjhuang@quicinc.com,
	quic_yuzha@quicinc.com,
	vbenes@redhat.com
Subject: Re: [PATCH] wifi: ath11k: allow APs combination when dual stations are supported
Date: Wed,  4 Dec 2024 09:30:39 +0100
Message-ID: <20241204083039.7103-1-jtornosm@redhat.com>
In-Reply-To: <20241204075128.5547-1-jtornosm@redhat.com>
References: <20241204075128.5547-1-jtornosm@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_003052_771665_EE5DA41D 
X-CRM114-Status: UNSURE (   4.45  )
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

I can share mine too if you want.

Thanks

Best regards
Jose Ignacio


