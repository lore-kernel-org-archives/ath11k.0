Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F295DC531FA
	for <ath11k@archiver.kernel.org>; Fri, 24 Jul 2026 09:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YY8zT4JmqSPdATyDqCCVUYQ0HFP8LkYhfzBPXdqUyvA=; b=p3Z5XNW9a+oQjJCQiouY+GA/ew
	2erGLNNwTDPRnaj8wiYHX7BR05DRP/y0jKt5o73SSbkHGm64GZjMHIrMSBYZhgbawSKVNC89nt+rs
	xq45W4nGgyl/pnShMYNImxpclC4ylkX5XgneTo3E0FtACBs6VvNi2ZmGiJpjyrkfAZYyIBLbQj8Tk
	dDYwAe5JKiFdbSwWbAaGSzqsKjLT01XsToFPKAz7Uz6etHGHbAGv3Z7GvYgwTlDQ1FOyMCJ401WBn
	ob5SIz3BtB6NQWQpNrCT9MaV4i3HAI4SAPVN1Q9ixzw/ihBTuxrZKFLB2GARBNv66Wxd82TM1zPdm
	2u+oIjrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCQT-0000000Fzb4-2HY2;
	Fri, 24 Jul 2026 09:42:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCQQ-0000000Fza8-3RsE
	for ath11k@lists.infradead.org;
	Fri, 24 Jul 2026 09:42:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784886157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YY8zT4JmqSPdATyDqCCVUYQ0HFP8LkYhfzBPXdqUyvA=;
	b=Bit2gFddBtN/cUdQ1zeLfDeG404eQ+B2eu2BQ/65jkmZFF2v4FYxubex8a0YYlm22NH/sw
	R65SdmZksrVi3yXkieFJ7hg9oVlMh8yNESmOVRf2EIlhFwNojV9YuElTKWBZ4wsLKBx5u5
	+Dy1I+s+oyXmmOqP6W4fCsROeyL0C5w=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-380-4kBllGYVNnGpIMs-uDq9KA-1; Fri,
 24 Jul 2026 05:42:33 -0400
X-MC-Unique: 4kBllGYVNnGpIMs-uDq9KA-1
X-Mimecast-MFC-AGG-ID: 4kBllGYVNnGpIMs-uDq9KA_1784886152
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D29D81801201;
	Fri, 24 Jul 2026 09:42:31 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.50])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5667A1954226;
	Fri, 24 Jul 2026 09:42:28 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: tamizh.raja@oss.qualcomm.com
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH v4 1/4] wifi: ath11k: use queue mapping for WCN6750 ring selection
Date: Fri, 24 Jul 2026 11:42:10 +0200
Message-ID: <20260724094226.227200-1-jtornosm@redhat.com>
In-Reply-To: <CABkEBKaZOEh4OrZTYfFOj8QZHY8Ruxn2rcXL-axWHwK4o6MECA@mail.gmail.com>
References: <CABkEBKaZOEh4OrZTYfFOj8QZHY8Ruxn2rcXL-axWHwK4o6MECA@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: Wh1ss9H-vvnQjdDxwRBs02udWHivTc6vUMId66zAPb4_1784886152
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_024238_932163_AD3EFC71 
X-CRM114-Status: UNSURE (   4.62  )
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

Hello Tamizh,

This is the same mapping already used by WCN7850 via skb_get_queue_mapping().
The patch only aligns WCN6750 with that existing approach.

Thanks

Best regards
José Ignacio


