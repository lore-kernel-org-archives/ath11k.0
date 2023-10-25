Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6F8C25B47
	for <ath11k@archiver.kernel.org>; Wed, 25 Oct 2023 09:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lKbmR8WT+L/N1TQIo3wmbdEKLr9GYDNx+aYchogK2Kw=; b=Yf6AusQMlaci1V
	NHNIKG8zzoboj49MidvKEESt9dNiLo/9iAdvocmq5pmEippw9ki4fU10pbltQfsCqhLMvVcPFeSy+
	tD6oMMGrXS7SUpPDsctA/4Eqsn6hD0HAr68WNopsPRGdDUcr49OsccP0wJbX/FpQn9M6am3Nwx2VZ
	LMqFc0p/8Xe7pgaC/4a3n5aRNxNCWGLXuYYdAnkHP7L++kbvyTQvw2mIFwBZS0idUAndTWLWlgauF
	hoKU0gnVlCeyb73dkpACfRB+Xy0rsvcZ8ak/Y0lJguaqv4UzOb0/RRljFDhJFBYl6ONxKd9iWj410
	Pow0maE/SEp1IXPfLYrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvaXp-00BsQT-20;
	Wed, 25 Oct 2023 09:51:21 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvaXn-00BsPX-0G
	for ath11k@lists.infradead.org;
	Wed, 25 Oct 2023 09:51:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B0E34CE24F0;
	Wed, 25 Oct 2023 09:51:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50ADBC433C7;
	Wed, 25 Oct 2023 09:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698227473;
	bh=+cg3kYM3oFry35hZbmbwSVjd6ek+Za/QIdrk5JlXVCU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Mk3aBPSYzxfaNtQwgFmWCAiO3PKRxQWVvwar4NEUMMiOvsIundUsqhpzRFFMObBCE
	 QveXtgBd9HCA98TLqFTA7yovLjoI21iZM1b2zsZT+w7MRzWAckSLuIKE2YobbE61dQ
	 sgLdpJ/XgcIOmVN79MziCxoVSJzNyhWmXslfB81mka1hPexK5GDEhlcoSjoBwK0fto
	 bW9Wzd1ZHIMD7kMd60aPMQtGNiYylkYtgeclMtVyBvZnyl1bTaNtztUOlC3YFUNyfZ
	 2+dIJhrxa0fr8p8lwqkv2YcQ8y8axKaoishIr0bOR+6khcx8rQgNlfypsgPtQ8fVrF
	 QAAdapnSoULUA==
From: Kalle Valo <kvalo@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,  Jeff Johnson
 <quic_jjohnson@quicinc.com>,  ath11k@lists.infradead.org,
  linux-wireless@vger.kernel.org,  linux-kernel@vger.kernel.org,
  stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] wifi: ath11k: fix temperature event locking
References: <20231019153115.26401-1-johan+linaro@kernel.org>
	<20231019153115.26401-2-johan+linaro@kernel.org>
	<87sf60xgs8.fsf@kernel.org> <ZTfUswqVkAgJvnye@hovoldconsulting.com>
Date: Wed, 25 Oct 2023 12:51:10 +0300
In-Reply-To: <ZTfUswqVkAgJvnye@hovoldconsulting.com> (Johan Hovold's message
	of "Tue, 24 Oct 2023 16:29:07 +0200")
Message-ID: <87bkcnxc6p.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_025119_299803_F59EE476 
X-CRM114-Status: GOOD (  15.89  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Johan Hovold <johan@kernel.org> writes:

> On Tue, Oct 24, 2023 at 04:59:35PM +0300, Kalle Valo wrote:
>> Johan Hovold <johan+linaro@kernel.org> writes:
>> 
>> > The ath11k active pdevs are protected by RCU but the temperature event
>> > handling code calling ath11k_mac_get_ar_by_pdev_id() was not marked as a
>> > read-side critical section as reported by RCU lockdep:
>
>> On what hardware and firmware version did you test this? As there's so
>> many different combos we use Tested-on tag to provide that information
>> in the commit message:
>> 
>> https://wireless.wiki.kernel.org/en/users/drivers/ath11k/submittingpatches#tested-on_tag
>> 
>> I can add that if you let me know what you used.
>
> I hit this on the Lenovo Thinkpad X13s and I guess the tag should be:
>
> Tested-on: QCNFA765 hw2.1 WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23

From ath11k point of view QCNFA765 is WCN6855 so I used this one:

Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23

> Note that I've only been able to test the ath11k fixes (not the
> corresponding ath12k) and I only tested this particular patch fully

Thanks, I added Tested-on to this patch 1 and for the rest I added
"compile tested only".

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
