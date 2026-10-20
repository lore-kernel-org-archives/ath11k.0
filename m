Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A296606A31A
	for <ath11k@archiver.kernel.org>; Tue, 20 Oct 2026 16:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Pholg/Gy;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GvCbYA/U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JZGvSJ/T2lFQAZNU+lUoUCnDcDPrtpGrw0LMffwgz3o=; b=Pholg/GynFq87oSEfl4Y2PZIYZ
	dgUt0y0dnRXBMZvVm9Tdf/nTzNbgf5L0ChBu8tyFADpLTpjOqRKgcMIfuwAdoFrc81IPiewQqOQyu
	4ZtrR/Dk5zg0k8wfZv1Ol9xUaUt5d0P9mLJPaEzpBeyMJ3ypukv+sLNDEjd1o9RDgl+iK5Ke+hoE1
	2UYbiIHbMGG4NB4ij665l1se5e+qcCZChnnutXZJe2vxuLlyS1QCk6VT++taUYMUSUA1/Ff8J5MmO
	zAvXbaxJvq736hNpHWSlQGL6qn0Q3LNb9G2lnbTeU1szvQeGomOHI3gNoX/W8eGPRGEu4g4gCH2l4
	Pu4qmZVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJCP7-0000000A7uv-2FiL;
	Tue, 20 Oct 2026 16:09:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJCP1-0000000A7rn-1uVx
	for ath11k@lists.infradead.org;
	Tue, 20 Oct 2026 16:09:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792512525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JZGvSJ/T2lFQAZNU+lUoUCnDcDPrtpGrw0LMffwgz3o=;
	b=GvCbYA/UB0M7Z3M2qQsXQ5hclNIg1GrEtSBrGDL8uEimjyyMPoTE7ywqoOyosx8IZr9his
	dvGVVPjsnEuQsIxVSGGGunZWTF429deMu1oFJWkO+RBHD1TxfRl2MbOP+y9AjcFHBnJkCm
	vwzDETVdHWwml8JI1bs28EwksII9NOs=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-686-PrNzLbbOMWmkiqW3IDyx1g-1; Tue,
 20 Oct 2026 16:08:40 +0000
X-MC-Unique: PrNzLbbOMWmkiqW3IDyx1g-1
X-Mimecast-MFC-AGG-ID: PrNzLbbOMWmkiqW3IDyx1g_1792512517
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BB3F7195E915;
	Tue, 20 Oct 2026 16:08:36 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DF6651800495;
	Tue, 20 Oct 2026 16:08:32 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: julius@bairaktaris.de
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	baochen.qiang@oss.qualcomm.com,
	hujy652@gmail.com,
	jeff.johnson@oss.qualcomm.com,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	tamizh.raja@oss.qualcomm.com
Subject: Re: [PATCH v7 0/4] ath11k/ath12k: implement TX flow control
Date: Tue, 20 Oct 2026 18:08:30 +0200
Message-ID: <20261020160831.2133912-1-jtornosm@redhat.com>
In-Reply-To: <20261018131930.1116724-1-julius@bairaktaris.de>
References: <20261018131930.1116724-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: d9Tchif9VM5hx-JABcJjUgC5IDpFr1OykHx36hhOtWw_1792512517
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_090928_112175_3C9A0A36 
X-CRM114-Status: GOOD (  11.94  )
X-Spam-Score: 1.2 (+)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Julius,

Thanks for the review and the Tested-by.

> One thing on patch 3, from reading the code:
>
>> +             if (num_free == 0) {
>> +                     spin_unlock_bh(&tx_ring->wake_tx_lock);
>> +                     break;
>> +             }
>
> When this breaks, the frames stay in the txq and nothing restarts it
> until mac80211 queues the next frame for that txq. A sender waiting for
> ACKs then stalls until its retransmit timeout. With AQL I measured this
> in v4: one download in three stalled, max RTT 347 ms. A restart from
> ath11k_dp_tx_completion_handler() fixes it.

Good point. The break when the ring is full is intentional, it keeps
the frames safe in the txq instead of the current -ENOMEM drop. Your
TX completion restart (patch 6) would make the recovery from that
stall faster, which is a nice improvement on top. Another reason for
both series to land.

Since we agree, I am going to split ath11k and ath12k into separate
series to try to unblock both.

Thanks

Best regards
José Ignacio


