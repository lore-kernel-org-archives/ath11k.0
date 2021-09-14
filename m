Return-Path: <SRS0=aNMw=OE=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C2D7C433EF
	for <ath11k@archiver.kernel.org>; Tue, 14 Sep 2021 17:32:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CA0760F70
	for <ath11k@archiver.kernel.org>; Tue, 14 Sep 2021 17:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4CA0760F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qb2XhTM0ZxMY9FZHeaEXWDW8bItGKqwFugLwtDbftBA=; b=a5kSA29cKcoYcBA2kX7pumLQFB
	qOJd6eKkZD0yPfFG5W+eRa9ADwSh4orIRpITLYbW7bqn1y8/W2vD2SN7mWmt+xAvcQSCWfEP7ZmZh
	ZeLxLhj+0WWhgZKKuShIsdQC7jJS/wgKKKCDTwjgO5/IQN/3raCvxJFALcr25ci2XdqmCgpdh5y2J
	ddfXToEkidygUKBtlYcbsWwwFuK/WtRGeYQcQdcMmwu6utN3icY/gIuMDJxP5dO0bLPkDKIRm8bBI
	4JuMsBKI9lUqs3z3klG4I6reaxuff/Gz/6Ebh7Hp0S5HopPo1KPUcb1jOooc4O+jPrhHpX2MXlJ18
	PTk5g3ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQCIU-006ZQG-O9; Tue, 14 Sep 2021 17:32:42 +0000
Received: from gateway22.websitewelcome.com ([192.185.46.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQCIS-006ZOj-66
 for ath11k@lists.infradead.org; Tue, 14 Sep 2021 17:32:41 +0000
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
 by gateway22.websitewelcome.com (Postfix) with ESMTP id 1E6261E6
 for <ath11k@lists.infradead.org>; Tue, 14 Sep 2021 12:32:27 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id QCIEm8woEjSwzQCIEmapfm; Tue, 14 Sep 2021 12:32:27 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3sP6jXMNnxu6PJJC0Lvm+qOKW0f/dGtu/4FvN9Uf7iM=; b=g8Az3FMGHjcUQunQDfThX3OfVx
 fI2MMchUpam/fzYsvIrUYzq3Ilrjsmjg+DZnyr7STqsjSE6Itbo44efKDrBR8yt4YU+riVw7lErnt
 dR21PRArQDvU37USJICiFK8IoldkWyUV2C51+PhJihApbCnlTysBXPUGldNdXyzWcDPxzCuk9viYi
 UOojkNYveJSd6GoERVUQOiaJEmTP0yFJ40vkx0Lblpafjwsw7qDE6uzkZbODbs5AN85CZa5jizmRL
 nSBET8eexfyAaLddgskzpeW2PpEoY/fqAQxhOK8cuFH/FuHeLymn32wmV6yeWV3dneeYdtffFwStn
 a3ziMzJw==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:34626
 helo=[192.168.15.9])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <gustavo@embeddedor.com>)
 id 1mQCIE-0035SF-A2; Tue, 14 Sep 2021 12:32:26 -0500
Subject: Re: [PATCH][next] ath11k: Replace one-element array with
 flexible-array member
To: Kalle Valo <kvalo@codeaurora.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20210823172159.GA25800@embeddedor>
 <6e8229a1-187c-cd69-ad1c-018737e5e455@embeddedor.com>
 <87r1dr1vpf.fsf@codeaurora.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <36d4e936-527d-e6ff-8f6a-e06fcb275327@embeddedor.com>
Date: Tue, 14 Sep 2021 12:36:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87r1dr1vpf.fsf@codeaurora.org>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.31.110
X-Source-L: No
X-Exim-ID: 1mQCIE-0035SF-A2
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.9])
 [187.162.31.110]:34626
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 5
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_103240_328804_78206B63 
X-CRM114-Status: UNSURE (   4.18  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org



On 9/14/21 02:07, Kalle Valo wrote:
> "Gustavo A. R. Silva" <gustavo@embeddedor.com> writes:
> 
>> I wonder if you can take this patch, please.
> 
> This is in my queue, please do not take ath11k patches.

Great, and sure thing. :)

Thanks
--
Gustavo

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
