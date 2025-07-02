Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5C8C83F04
	for <ath11k@archiver.kernel.org>; Wed,  2 Jul 2025 16:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mSSYZlzjDorHVrW9kO4wmXJF7vcClWLjaQL8PerBKvE=; b=uKV9hCYu44giVl0ckZ3IReLEwr
	OTAT5ZeIikjlZiXkp/I1ZTA9Nl4hC0VHYh49z/3a7XrwQZQ1zPvD0z21aFvss0w+stHgADVyZ4S2y
	afIYoq/MyGOgKhKxoOVgvI+ket3WHhArIY7tCM6v+2kJLZYpGMWiQH/dVkYkNvVIbdMlqLdkwLnpf
	xOsdNAvo9PubaJ/5n58eZWJiHmD6iNOJg7n5pWxmTjBXGMz4aLTYfR3zHIfwjx6l2tnqU5wCYxFWh
	y5zMmg8DqKviZhy0ajOt/X/Mj/fNXDNJ7KcVe0SDJXDSuGh+JzIvhFgiAA7wntcggk0ND2ILwDKL/
	neMHY3eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0QU-00000008xpc-09uE;
	Wed, 02 Jul 2025 16:35:14 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzLI-00000008mXl-0FKV
	for ath11k@lists.infradead.org;
	Wed, 02 Jul 2025 15:25:49 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1751469910; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Wh4ld+IjPq9rN2v5JrrVbNCJ9Tenxzp/ewU5rqFiunyck4YH3W/tqzh9RZebHG9/ZumIQDhyv5HaQIhnaxA7xPvOmM8lQRQnR189PqUybYczVNFT4AIlTrrAP9D74+vqrH5LwOnwJNo4cPSXgixvX36ChYUJwsrd3oC1lLPCPZg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751469910; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mSSYZlzjDorHVrW9kO4wmXJF7vcClWLjaQL8PerBKvE=; 
	b=dhdQKgAwyG58FQVyICKT4UXpZblCNhIUSpwm3Xg+BFbPESCNAEFUUOcwJGqofWtMAlsyEPky41WQsUzaTyJ0yp4dJdZgTKWKOkVwNVITcLkDVg4C2z/rpf8G7pVD1n5ZpM0kxwOwZFBDOypzGPWuZO4mdOFyVf5WBCWEYDU81uI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=usama.anjum@collabora.com;
	dmarc=pass header.from=<usama.anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751469910;
	s=zohomail; d=collabora.com; i=usama.anjum@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=mSSYZlzjDorHVrW9kO4wmXJF7vcClWLjaQL8PerBKvE=;
	b=DeNXlsfHaMk2Kd1KbaP+z5CgMeLB/0Y79MStxyfuES5HDSFJK/8eDKuQ6yEEGcl8
	z/QOHyIUBVrJunQiap/b+INWBeqtAytqUaKAnv60qL1mZGjRYpXmjO3Dgla5mOfL/GB
	SVkbt+cCJd9w+pA5ueE3JjlaEEEN3y/GCx97BCgo=
Received: by mx.zohomail.com with SMTPS id 1751469909243485.9751973058537;
	Wed, 2 Jul 2025 08:25:09 -0700 (PDT)
Message-ID: <ed010318-8a10-4a8c-b8d4-721bdf631c2b@collabora.com>
Date: Wed, 2 Jul 2025 20:25:03 +0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] bus: mhi: don't deinitialize and re-initialize again
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Youssef Samir <quic_yabdulra@quicinc.com>,
 Matthew Leung <quic_mattleun@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
 Alexander Wilhelm <alexander.wilhelm@westermo.com>,
 Alex Elder <elder@kernel.org>, Kunwu Chan <chentao@kylinos.cn>,
 Siddartha Mohanadoss <smohanad@codeaurora.org>,
 Sujeev Dias <sdias@codeaurora.org>, Julia Lawall <julia.lawall@lip6.fr>,
 John Crispin <john@phrozen.org>, Muna Sinada <quic_msinada@quicinc.com>,
 Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
 Maharaja Kennadyrajan <quic_mkenna@quicinc.com>, mhi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 kernel@collabora.com
References: <20250630074330.253867-1-usama.anjum@collabora.com>
 <20250630074330.253867-3-usama.anjum@collabora.com>
 <2025070128-chihuahua-slimness-da88@gregkh>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <2025070128-chihuahua-slimness-da88@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_082548_189752_638A1184 
X-CRM114-Status: UNSURE (   7.21  )
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

On 7/1/25 3:25 PM, Greg Kroah-Hartman wrote:
> On Mon, Jun 30, 2025 at 12:43:29PM +0500, Muhammad Usama Anjum wrote:
>> Don't deinitialize and reinitialize the HAL helpers. The dma memory is
>> deallocated and there is high possibility that we'll not be able to get
>> the same memory allocated from dma when there is high memory pressure.
>>
>> Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
>>
>> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> 
> No cc: stable?
I'll add it to entire series.

