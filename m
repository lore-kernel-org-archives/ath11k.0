Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA9ADC433F5
	for <ath11k@archiver.kernel.org>; Thu, 23 Dec 2021 08:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Ewpz4fsCXfJ0C6jZicf3femWJ7CX5H/E6dyYgG7L7c=; b=1M7VnGBlVT4+DK
	yWqm3L5eMhlBgtcQ2ZKP00tMLgAcijh63thvb/c3TOW0wIvb55N36Ucwl3LXz55fA0EaF1ji6Un09
	j2zwcNT0c53lW30NxGUhuibl6rr2oOklvfezV72IUobJKboPzYyBf5u7jIdawOg+SWQeB0Bi7wbqN
	VvQDh0bIy89gWX+7vDD1tFnI9zYtoTGxgxRE815ggiF6zvtZbM0ZtFxpzPInTTtw8HiF59PvnQyxS
	54LTwHGXb+XDGwQbBsLzPEFqUp+YYlJoqOtPDvAJwk96vpJcj8X9ko4Mdl799KlSGFVezgkZEZRUY
	UkbKTPU++9PUwAG0/CTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0Jw3-00CMTc-8d; Thu, 23 Dec 2021 08:58:51 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0Jw0-00CMSe-Ba
 for ath11k@lists.infradead.org; Thu, 23 Dec 2021 08:58:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
 From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=KsJ2TJPRyi4Zv5mEmGNqe15nnzTGdMXqdmQKuv/1xbo=; b=PDeWkSzDXdeTkmrc6Q4dnySSwh
 kU7KRRkSEisyXKzj3LFsziinTbMBIq7SHNHA/TbFZ+eW8SkGWUd6Mix9NBOtMzqIs+Jlj8ax06mcj
 A6lhNwABOJRTvYwmAbP5S+D/jc2TkBcgS+xCw4Nqd/aGeB6aExgXghDxgmpEqj6f+Nls=;
Received: from p54ae97a7.dip0.t-ipconnect.de ([84.174.151.167] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1n0Jvw-0004wg-KP; Thu, 23 Dec 2021 09:58:44 +0100
Message-ID: <89da4b36-e814-9238-71a6-044af49e8de8@nbd.name>
Date: Thu, 23 Dec 2021 09:58:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
 ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <1640248077-14075-1-git-send-email-quic_periyasa@quicinc.com>
From: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH] ath11k: Add peer rhash table support
In-Reply-To: <1640248077-14075-1-git-send-email-quic_periyasa@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211223_005848_647008_AEFE5F69 
X-CRM114-Status: UNSURE (   8.40  )
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

On 2021-12-23 09:27, Karthikeyan Periyasamy wrote:
> When more clients (128) are connected, the UL data traffic
> KPI measurement is low compared to single client. This issue
> is due to more CPU cycles spent on the peer lookup operation
> with more clients. So reduce the peer lookup operation by
> modifying the linear based lookup operation into the rhash
> based lookup operation. This improve the peak throughput
> measurement. Since this is a software algorithm change, it is
> applicable for all the platforms.
> 
> TCP UL 128 Clients test case Observation (64bit system):
> Previous: ~550 Mbps
> Now	: ~860 Mbps
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01067-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Why does ath11k keep a separate peer list instead of just using the sta 
entry? That seems ugly and inefficient...

- Felix

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
