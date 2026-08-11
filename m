Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FACC5CFCF
	for <ath11k@archiver.kernel.org>; Tue, 11 Aug 2026 11:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZevwHzhpm82rY3Q7CIME/Xq4cR9/ImEJ3tGIPz//zTk=; b=OR0yy9N/F6FCzcW0yh0G0rlgSS
	wx4UCywY33T117giN2ElbhDb92PZdhDn6bU3NlyTHrkFGInYSr1Xx0BMIHYk3WiwMkBRCjy3J/GSL
	uvnNZh9Lvm7xunSQBv1aGirir3dmng2nXFp5X83qq/aMpuO2DCHGvTj8SbpBywl0AnArA7Uot9sDc
	na/2LGqRl7nfg0rVbsZ5hlZoDbHBQ+pTVvuVLJyQVp3GTZsXS3DLJnMZcL5ib8Xh2S3xj6WHl3DtM
	HUaTdn3grbLlVcDu5BnjlQlsjy2/xCJwIfZQiOOUlANomxkQyjv8mSSXE9uMm23UzaCmpGsjYZjRy
	/UWCHyOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtkQy-0000000DuSc-2ReE;
	Tue, 11 Aug 2026 11:14:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtkQv-0000000DuRp-3Lml
	for ath11k@lists.infradead.org;
	Tue, 11 Aug 2026 11:14:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786446852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZevwHzhpm82rY3Q7CIME/Xq4cR9/ImEJ3tGIPz//zTk=;
	b=HfJBRsOnHCd9ciLWT1y8VAmcF6bmXsD40Xh+wfOS3rzgMaF6vMLFUeD5zlKStaH/6PnzFv
	/pI9C+qyN7v9NHK30mrxg8wRUMKB/vBeQtCmYGsdcVAqJ/v0kOKJnUUwVCu+Gx1r66LWJR
	WlcCWpedTAhbGQY1aFlIcuuLOt0Wxts=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-331-2ONlxj_uPsi5N9kJgCxqag-1; Tue,
 11 Aug 2026 07:14:11 -0400
X-MC-Unique: 2ONlxj_uPsi5N9kJgCxqag-1
X-Mimecast-MFC-AGG-ID: 2ONlxj_uPsi5N9kJgCxqag_1786446850
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 30E1D1800644;
	Tue, 11 Aug 2026 11:14:10 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.32.68])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 44FB1195DF91;
	Tue, 11 Aug 2026 11:14:07 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jeff.johnson@oss.qualcomm.com
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH v5 4/4] wifi: ath12k: implement custom wake_tx_queue with flow control
Date: Tue, 11 Aug 2026 13:14:05 +0200
Message-ID: <20260811111405.397112-1-jtornosm@redhat.com>
In-Reply-To: <0b72231d-59f8-49bf-82a0-76d2c7862729@oss.qualcomm.com>
References: <0b72231d-59f8-49bf-82a0-76d2c7862729@oss.qualcomm.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: Mrimc16UpfpecYe1-czw3xiqrprtHhS5UVyBqWSgsKs_1786446850
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_041413_910210_540D8128 
X-CRM114-Status: GOOD (  14.55  )
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

Thanks for the review, Jeff.

> Tested-on missing

Ok, I will add it in v6

> NAK, must be EXPORT_SYMBOL()
> The ath12k code was contributed under the license:
> // SPDX-License-Identifier: BSD-3-Clause-Clear

I did it in an automatic way, I will fix it in v6

>> +	rcu_read_lock();
> 
> does this lock really need to be held for the entire function including the tx
> loop?
> 
>> +
>> +	arvif = rcu_dereference(ahvif->link[link_id]);
>> +	if (!arvif || !arvif->ar) {
>> +		rcu_read_unlock();
>> +		return;
>> +	}
>> +
>> +	ar = arvif->ar;
>> +	dp = ar->ab->dp;
>
> or is it sufficient to cache these values and then rcu_read_unlock() here?
> my LLM reviewer seems to think that would be sufficient
>
> note the spinlock in the while loop will cause the RCU read lock to be held
> when invoking mac_op_tx(), satisfying the RCU lock requirement there.

Keeping rcu_read_lock() for the entire function is intentional. 
ath12k_wifi7_mac_op_tx() calls rcu_dereference() internally (on ahvif->link[]
and ahsta->link[]), and with CONFIG_DEBUG_LOCK_ALLOC, rcu_dereference() checks
lock_is_held(&rcu_lock_map) via rcu_read_lock_held(). 
Only an explicit rcu_read_lock() sets rcu_lock_map and spin_lock_bh() does not,
so releasing early would trigger lockdep warnings.

> using guard(spinlock_bh)(&tx_ring->wake_tx_lock) would eliminate the need for
> all the spin_unlock_bh(&tx_ring->wake_tx_lock) calls

Better, I will use it in v6

>> +
>> +		spin_lock(&tcl_ring->lock);
>
> seems this should be spin_lock_bh() to align with all other callers in the driver.

The outer spin_lock_bh(&tx_ring->wake_tx_lock); already disables BH, so
spin_lock() for the inner tcl_ring->lock is correct and sufficient. Using
spin_lock_bh() would redundantly disable BH again.

Best regards
Jose Ignacio


