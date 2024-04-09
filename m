Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E22CD128A
	for <ath11k@archiver.kernel.org>; Tue,  9 Apr 2024 21:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DnLOeLETMfr9szDDiTAWX9eoEbMZT8svSFqOh4k7jb4=; b=B15Ypy0XonctGrxu948EDxqNLv
	6MXJgJggAWFEtqhpd/ov4+HFqMMUdyhPRlkLgSb8BlOJzIlTfjg7VAYl9fGHM6DnJG80RN67cIN1y
	99B9lwiOYyqF+OxfqPen+/f1mP+OLy0fY4NL1RbmmXw9qWmhHZQPKPdLOzLXzFmlqTQ6oMVFroarN
	83qu5MuumeB7TxcUZgq3qGWmIQiAOemv1scQH/godgwkDIMF86nR9ufeHnnTUoTobVtdBH1NkmgRu
	168bn6BCTN4zV2uPt7EtXaVCOq3H/uEz28hK3suLnK26PDMhokw+JrnZU40G6MD43DM3h56rGhZku
	1dZqfM2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruJ9H-00000003vRV-1SSV;
	Tue, 09 Apr 2024 21:36:59 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruJ9E-00000003vQs-20WE
	for ath11k@lists.infradead.org;
	Tue, 09 Apr 2024 21:36:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 47A4CCE2241;
	Tue,  9 Apr 2024 21:36:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04FE7C433C7;
	Tue,  9 Apr 2024 21:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712698613;
	bh=DnLOeLETMfr9szDDiTAWX9eoEbMZT8svSFqOh4k7jb4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qV7AVBUHnH0DfbZGWscQ85F51SrwD666zZzJpmq24viHXRQ28ze1azompCotzHETq
	 3skThZ+CrSTuKlGAg8KjDgMhwS5d97WPMTXLzaUoxZzbL+PilEscDpG9dFjDFtQUJ/
	 0I0csVV7eyjvr2jqI9egjh9TmRgMMOUyOKyiv8NNBZi/eRWm/TZRfNkkCwp1ccMFqM
	 frgrF9NSGFVCXbhn5vK7L3rqNbEXnOAwDEBWawZV5iTFPZ557s/lAcdh4XdbS58mrc
	 fNEqBe9iJwtX3tVsrjzRlNGkACJOxA3ObuoBrbHk0BdIKvUlFH38ly+AZP2PeqmzeY
	 TimcWEvz5NKIA==
Date: Tue, 9 Apr 2024 14:36:52 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: <davem@davemloft.net>, <edumazet@google.com>, <pabeni@redhat.com>,
 Baochen Qiang <quic_bqiang@quicinc.com>, <ath11k@lists.infradead.org>,
 <manivannan.sadhasivam@linaro.org>, <linux-wireless@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <mhi@lists.linux.dev>,
 <netdev@vger.kernel.org>
Subject: Re: [PATCH v7 2/3] net: qrtr: support suspend/hibernation
Message-ID: <20240409143652.57bc8cc3@kernel.org>
In-Reply-To: <87il0q28a5.fsf@kernel.org>
References: <20240305021320.3367-1-quic_bqiang@quicinc.com>
	<20240305021320.3367-3-quic_bqiang@quicinc.com>
	<8734s02b3s.fsf@kernel.org>
	<87il0q28a5.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_143656_740052_2ED9EF1C 
X-CRM114-Status: UNSURE (   6.55  )
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

On Tue, 09 Apr 2024 12:29:54 +0300 Kalle Valo wrote:
> No reply from netdev maintainers but as the patch is marked as 'Not
> Applicable' in netdev patchwork I guess they would not have major
> objection to take this to ath.git. It should go to net-next in the next
> wireless-next pull request anyway.

Sorry for the silence, FWIW no objection/opinion here.

