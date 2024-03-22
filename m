Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E7DC47DD9
	for <ath11k@archiver.kernel.org>; Fri, 22 Mar 2024 10:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4BqPVM87gJjFNn3Odmy/BJLvrQJMrIynptnhPUZvsk=; b=1JF+R8CLp0Ihm6AHNXFKHRGX02
	Chaa8JWSw0wmKLFdsNvn90hljI5yDvRTEcNLCdAeFA61u0LqlyjeclhJNtWYvpRzQWwhiWnbqhTD/
	5lPtUDxd3IT6wL/uQ8ymI+oWRXA23FX+zAQgf2O4AuSN/hFJYU1MjQhI7z6LH9BOz7yjn9Bw4gvKG
	r6I9XhoL0a9qOkTim/+0BNalyyi98XfoEJt4fH6995ZD5gf6K1grPYf3JjONTeioDmKVpQGhZWxLU
	2DGfDJX8QBBcOMzUG6CN6e6NE0AOvYJDirrtUMXAINcxlv8VwzYeacoem12okixWaFJ7OqrPKC4z8
	PbpCEU1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rncHr-00000006p8G-3X89;
	Fri, 22 Mar 2024 10:38:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rncHo-00000006p6t-1I2F
	for ath11k@lists.infradead.org;
	Fri, 22 Mar 2024 10:38:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711103886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l4BqPVM87gJjFNn3Odmy/BJLvrQJMrIynptnhPUZvsk=;
	b=hwwPnSDzQSTwVMpCXnTW2aCUhVxAHH6i8usm5gCCQVnPTivYXDaNwkCo4JcmHiX6UKjSdC
	DFO7jodFhiDKEWZXeZWxwodmT2JI9qv7A0is7WMexId7cSgHhNBQooJA7izB9T2UodJ0dn
	V9EzMozxipWz4AEL/7laWFHhq7P5yyo=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-643-WDxoLs2MOnOpqy38yxNsMA-1; Fri,
 22 Mar 2024 06:38:04 -0400
X-MC-Unique: WDxoLs2MOnOpqy38yxNsMA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7FDC53C025D9;
	Fri, 22 Mar 2024 10:38:03 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.193.83])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8D2D9C041EF;
	Fri, 22 Mar 2024 10:38:01 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: quic_bqiang@quicinc.com
Cc: ath11k@lists.infradead.org,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH] wifi: ath11k: workaround to use VMs
Date: Fri, 22 Mar 2024 11:37:53 +0100
Message-ID: <20240322103756.94296-1-jtornosm@redhat.com>
In-Reply-To: <87f0c6c9-43e5-4ea3-8f4c-9425e6a74b10@quicinc.com>
References: <87f0c6c9-43e5-4ea3-8f4c-9425e6a74b10@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_033808_462614_4F3FA597 
X-CRM114-Status: UNSURE (   5.46  )
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

Thank you for your comments.
I don't have seen any change in MSI vector data but if it can be different from zero I will complete it.

Best regards
José Ignacio


