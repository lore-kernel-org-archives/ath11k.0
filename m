Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4CEC4725D
	for <ath11k@archiver.kernel.org>; Mon, 22 Jan 2024 14:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0wLsVDqbRVVzD6Jk899cSgYYI5UODFHw/IeHEPQKx/U=; b=40L0TiIlaqIapf9kQY369cT3he
	ScfJZGD0B00sFQ9jmPYsaKBR25TYFUFsv0T/wfz8QFVI2EcR81s5LudzYMcg5E3iTfnG10d/JZ/MZ
	uQGYU3K7IhTLNNc9HCisfOV+nEGkh7mS3GBjcfCTkAbdMC9Yc/lQdc8GLfNa06lKtXDhzH5vdGlbE
	ofVu6AVRCc80+oVsx0ckQqGBMEUm6fV/uHnQPqxYUlQLQ+/yMacjusqE4Y94D3v30O3CfIPi0ce9c
	V7nmzStVpgOE/rfg0uHALNbIsFThnKflqCgyjJ8fI/lWKFpAhGQOXbWiy8u5f8Jp/S5vz0Rxko03H
	g3JBeN7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRuuB-00CLbB-1i;
	Mon, 22 Jan 2024 14:04:03 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRuu9-00CLaU-2J
	for ath11k@lists.infradead.org;
	Mon, 22 Jan 2024 14:04:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 3593EB80DE1;
	Mon, 22 Jan 2024 14:04:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ADDCC433F1;
	Mon, 22 Jan 2024 14:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705932239;
	bh=uB+xAUnhOKylzIpbYFxEwD5Rje9Cwg6aWG5W9GJI7Cs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CzEHrh1lPdFqtVb9l+WgSxQUnjB7Aw6g1D1N9dKatukMp6j8UbcCiZDJsth8RLU/u
	 G73PtI+HjAQsBN7eW9AjxM+QyiGiD35Ny449HnyBltZc6FV4QIZcVS5KH6vWWl3W6x
	 gyAIh8znB+E3vF6UJlPPFq0gaaITQd7E8zmf40EjDv3RVrYoCpgnj5hewia4Huh/t7
	 9U34BJhmnQsdGnAfs3p6MAycc/3hGrbTpInJ6fMxHf8qGTAD15XtYqdBQmBi1Pu+9d
	 106XbGZ4nC7sxWHW8XeBmfVSIkVspsAlJzztUKOUJR71KjL5GWu21GeR0yF7xL78U1
	 MgwwAVdSWfBwg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rRuuJ-000000008K2-1TOS;
	Mon, 22 Jan 2024 15:04:11 +0100
Date: Mon, 22 Jan 2024 15:04:11 +0100
From: Johan Hovold <johan@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: ath11k: checking RCU usage
Message-ID: <Za5124pntbOOtURc@hovoldconsulting.com>
References: <20231019153115.26401-1-johan+linaro@kernel.org>
 <87o7goxget.fsf@kernel.org>
 <ZTfgJCBxsNv3bVjv@hovoldconsulting.com>
 <87zfx98r6a.fsf_-_@kernel.org>
 <Za5pOIkQ0SN2XzHr@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Za5pOIkQ0SN2XzHr@hovoldconsulting.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_060401_892528_8CE114BC 
X-CRM114-Status: GOOD (  10.64  )
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

On Mon, Jan 22, 2024 at 02:10:17PM +0100, Johan Hovold wrote:
> On Sat, Jan 13, 2024 at 12:26:53PM +0200, Kalle Valo wrote:

> > I just found out that sparse has __must_hold():
> > 
> > https://lore.kernel.org/linux-wireless/87sf31hhfp.fsf@kernel.org/
> > 
> > That looks promising, should we start using that in ath11k and ath12k to
> > check our RCU usage?
> 
> I see that Johannes already commented on this in the thread above.
> 
> I'm pretty sure smatch can't be used for this.

I meant "sparse"...

Johan

