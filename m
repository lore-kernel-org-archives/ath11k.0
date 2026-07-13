Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFFDC43458
	for <ath11k@archiver.kernel.org>; Mon, 13 Jul 2026 15:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=88RxX+JkWNZbQ2cIlHOd3evCkQ6J14mP3ECcOysTa0w=; b=ziiXeblgaRba6pFRYRAnkMRE1e
	kLmtxGI0wLxJm2KTiNHytfDb+99zNxMGIX/lL1PUDXxD6q2lEAPEzeirqs7Daa2LDMmX9mcnS5yl4
	Tla/1jMkg7BfEZHX2gsADWWs6fbih1MCmmg0e3AUtvWwCgvgLHFd4phSvsIk/+GaZm1BNSCfK8Q81
	hHGXAAxp0ZEh7fyL1OXs65EYAcScv212pCbTQKDZ0/DK1SVWq0njwwR8nOsVkhoYc/o0hIo/ceiH+
	7cbT/ChaUVe6D2ePdNMWid820JPomIaVcPtTMy6syZOpkaNTbCXPI77sRSM6ckYHbXovjq4Wbn9BS
	C/cfZ0oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIBy-00000009iYM-0U9n;
	Mon, 13 Jul 2026 15:03:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIBw-00000009iXi-29D7
	for ath11k@bombadil.infradead.org;
	Mon, 13 Jul 2026 15:03:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=88RxX+JkWNZbQ2cIlHOd3evCkQ6J14mP3ECcOysTa0w=; b=HxJDLTL6RKtahjWy25EqRPWiqd
	T4Tlu69oh94Di9BmMKg6+98Hr7704qdtvYIIjMhKzkmOUQF3fR4MnyDlXoOPMGDaXFzW+hu0TJMxX
	tn+P8grk+lQCZ8loD1Xjha53jye/RucmWxTdK/YyYBKHRcijjIIBYoW5YKR6y/Zo8VWyBNxRbp8uG
	dpx5fUWNkJdf2mO5GKQ0pPxmWfCQowvhhzRBGQYKW0S70cWI1nWBylhp2iqskgoxomEX1j6o7xjkZ
	j3Cy/VKwDtSapCtfLvNBot1IVDz5bNWKfBpWdYXk3hYvbkEXTKFtvXQZox42AsJc/91zBgABU/hsx
	iyI7hFaw==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjIBt-0000000Bkgr-1uBI
	for ath11k@lists.infradead.org;
	Mon, 13 Jul 2026 15:03:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783955006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=88RxX+JkWNZbQ2cIlHOd3evCkQ6J14mP3ECcOysTa0w=;
	b=hmMsRIbTTYSPxBXxFTxEasurFUH0kiRI22xE3ISCQZS4XRBXX5Bi0OpScIyla11/OD/18z
	8zTtCyyLKIXTX6vXAEYoUF7FIsdKPvKZWL1qTaqXuaR38PA0iic4aj0Nw/zNf0kuR/ZvSJ
	+ofAHbbOSoCoY8MaYOYSWtAbk2viPnU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783955006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=88RxX+JkWNZbQ2cIlHOd3evCkQ6J14mP3ECcOysTa0w=;
	b=hmMsRIbTTYSPxBXxFTxEasurFUH0kiRI22xE3ISCQZS4XRBXX5Bi0OpScIyla11/OD/18z
	8zTtCyyLKIXTX6vXAEYoUF7FIsdKPvKZWL1qTaqXuaR38PA0iic4aj0Nw/zNf0kuR/ZvSJ
	+ofAHbbOSoCoY8MaYOYSWtAbk2viPnU=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-495-foHAshqCPpOhpbdRenkVsQ-1; Mon,
 13 Jul 2026 11:02:00 -0400
X-MC-Unique: foHAshqCPpOhpbdRenkVsQ-1
X-Mimecast-MFC-AGG-ID: foHAshqCPpOhpbdRenkVsQ_1783954918
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A66ED18009FC;
	Mon, 13 Jul 2026 15:01:58 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.81])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 763911956086;
	Mon, 13 Jul 2026 15:01:55 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: hujy652@gmail.com
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH 1/2] wifi: ath11k: implement custom wake_tx_queue with flow control
Date: Mon, 13 Jul 2026 17:01:49 +0200
Message-ID: <20260713150151.2343583-1-jtornosm@redhat.com>
In-Reply-To: <20260711153336.542-1-hujy652@gmail.com>
References: <20260711153336.542-1-hujy652@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: wvZXhHdv053sjV1EYikUrdwXrG5yVrWaRgwoofz_Z2E_1783954918
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_160329_817886_89C76926 
X-CRM114-Status: UNSURE (   9.11  )
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

Hi Zhi-Jun,

Thank you for the review.

> In wake_tx_queue:
> ring_id = txq->ac % ar->ab->hw_params.hal_params->num_tx_rings;
>
>In ath11k_dp_tx which is called by ath11k_mac_op_tx:
>ring_selector = ab->hw_params.hw_ops->get_ring_selector(skb);
> ti.ring_id = ring_selector % num_tx_rings;
>
> Are you sure ring_id will be the same?
You're right — txq->ac % num_tx_rings doesn't match
get_ring_selector(skb) % num_tx_rings on all platforms.
In v1 the ring identification was only correct for platforms where the ring
selector happens to coincide with the AC, but not for platforms.

I will send a v2 trying to solve this globally for all the platforms.

> Also mgmt frames use a different path.
Correct — management frames go through WMI, not the TCL data rings, so they
are not affected. The flow control applies to data frames, which are the
ones causing the problem since they use different TCL rings depending on the
platform's ring selector.

Best regards,
Jose Ignacio


