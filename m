Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C86DC433F5
	for <ath11k@archiver.kernel.org>; Fri, 26 Nov 2021 14:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zVJLVuVeZmdSRu9/kTqJ3Co9wqjimIofU/O4Ivq1/Pg=; b=niCe/KPoy15zqr
	MzTt1YaOTEHPoWdxYBG5Vfm0b8daKFl5iVzrRZjiglSUuYYnspcotCSlugiIoXj68lrHeIYTKVPZN
	jABDykGuWrH9O6O1hgSjBMQ3nBfGJvY6GW5sRXHpnetaPYe1l3sk9OuJy+sdIK5NLnvkbpwM13QNR
	8HDNF43O/gnkNLgFrH8g6FUBCZdn8+/lQuD1J9598RpSmlt6F7VP4azKcJMp8rssqVWEdX1p7bBTZ
	0pefa/QmR0NX//FNvd927C+84B8v6AVkomnqZ14nv4id81sh56RaRQgjQLQm+nDOyudxJ5xyz94W4
	NpvSI8R+ZBmzbsPhkHpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqccR-00Aqzq-2N; Fri, 26 Nov 2021 14:54:31 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqccN-00AqyG-Sp
 for ath11k@lists.infradead.org; Fri, 26 Nov 2021 14:54:29 +0000
Received: from [2a04:4540:1400:cf00:853a:6162:5f49:5bef]
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <john@phrozen.org>)
 id 1mqccJ-00020w-Bd; Fri, 26 Nov 2021 15:54:23 +0100
Message-ID: <4c778b39-3c32-2b7c-9f91-4aba49fbe4ca@phrozen.org>
Date: Fri, 26 Nov 2021 15:54:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: ath11k: QCN9074: Incompatible board-2.bin for 6GHz
Content-Language: en-GB
To: Sven Eckelmann <sven@narfation.org>, ath11k@lists.infradead.org,
 Lavanya Suresh <lavaks@codeaurora.org>
Cc: kvalo@codeaurora.org
References: <2091899.pNsEtq2SQc@ripper>
From: John Crispin <john@phrozen.org>
In-Reply-To: <2091899.pNsEtq2SQc@ripper>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_065428_154563_22F594F9 
X-CRM114-Status: UNSURE (   8.00  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org



On 26.11.21 11:52, Sven Eckelmann wrote:
> I found out that this is actually caused by the BDF. If I've extracted the
> board.bin from the TIP board-2.bin [3] (which seems to come from the QCA
> ATH.11.4 CS release). With this version, it seems to work fine. I haven't yet
> found out what the relevant change is - but if someone has hints then this
> would could be interesting for other devices which should be added to things
> like OpenWrt.

Kalle's repo is outdated by several releases. This is the new upstream 
repo.

the error you are seeing is an ABI breakage between pre/post sfp11.4 
fw/bdf. using a fw >= 2.5.x requires a BDF generated with / derviced 
from >= sfp11.4

the BDFs inside the TIP repo come from here
--> https://github.com/quic/upstream-wifi-fw/

	John

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
