Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90304C4167B
	for <ath11k@archiver.kernel.org>; Tue,  5 Dec 2023 03:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:From:To:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bTHvAwz4pRsHGdSYFA85IYtgD6rufPtY98UBoo7roKU=; b=SgsVP4V9fCPUzUM1V2/pi58XuG
	PClnAnjQERAOoSle3T2aRaibFMUHMZNAZySYrQS9IPV8lsAj5m5eiw/YYFwO2YLvTdfCWRyHcL2we
	4jkkHCtYPlkYWFqTdsviqr3z0dIy9jIGqQbnaSOKpblmSj9p/Z1lBFeC7fsWG1gIhxWR6n1JWfR+U
	hOZE4xvcGH1np9co7Q65I9BngDQuxJWzwggJC5Z4bPwEokpsDcx9YcTQO/e04DdVi7NyvThZEnPWg
	w0xVec3tNHfM7pFRYOePeyQeZkggWiSwFZSfVM02BI5lKsF9nZUNLV6iJitLWuNV1b81RUNpOefz8
	Si32wsHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rALsN-0066eB-1r;
	Tue, 05 Dec 2023 03:13:35 +0000
Received: from smtp-8fad.mail.infomaniak.ch ([83.166.143.173])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rALsK-0066dj-2Y
	for ath11k@lists.infradead.org;
	Tue, 05 Dec 2023 03:13:34 +0000
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [10.4.36.107])
	by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Sklwh418GzMq0NF
	for <ath11k@lists.infradead.org>; Tue,  5 Dec 2023 03:13:24 +0000 (UTC)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4Sklwh1cwjz3Y
	for <ath11k@lists.infradead.org>; Tue,  5 Dec 2023 04:13:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ik.me; s=20200325;
	t=1701746004; bh=q6ZAzmPE6GfLJ0F6n75WoAzCK7avvFTFV0pcVotqfIc=;
	h=To:From:Subject:Date:From;
	b=1EYHl0uNp+qx5Rk/Nk7jDpVkbUUP5kzs0iJr6zAEdllQEd6+rYFopjuVZMfrOkTxz
	 U0n2KHnF+9PmuZH+mepChIF94dGU8oa4NaP2UL64RmaNyrVKhN+b/k//I86GdXFVgj
	 tq8UdOlEatmTd7K19gHTsij1JWeNCBY9nbd3KMc8=
To: ath11k@lists.infradead.org
From: Fourhundred Thecat <400thecat@ik.me>
Subject: bizarre network problem on kernel 6.6.4
Message-ID: <39e47336-79f6-5465-7768-a405e2ee3b0a@ik.me>
Date: Tue, 5 Dec 2023 04:13:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_191332_969751_4B957538 
X-CRM114-Status: UNSURE (   9.52  )
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

Hello,

I have the most bizarre network problem on my laptop that I have ever
seen, and I don't even know where to start:

This is lenovo T14s Gen 4, using qualcomm driver ath11k_pci

Previously I was using kernel 6.6.1 and wireless network was working fine.

Now I compiled kernel 6.6.4 with identical config, and when I boot it,
wireless network does not work:

- WPA supplicant authenticated and associated successfully
- ifconfig shows interface wlan0 is configured properly and has IP
address 10.1.4.8
- route is configured properly:

  default via 10.1.4.1   wlan0 onlink
  10.1.4.0/24            wlan0 proto kernel src 10.1.4.8

but I cannot ping even my Gataway: 10.1.4.1

bizarrely, when I start tcpdump on my gateway, I see arp requests coming
from my laptop asking for some strange public ips, such as 208.163.36.0

when I interrupt ping, and start again, then arp asks for other strange IPs.

But in every case, I see only these arp requests, not the pings coming
from my laptop.

But when I ping the other way (from gateway to my laptop), I do see the
incoming pings on my laptop (but no response pings)

Also, with "arp-scan -l" on my laptop, I see other devices on my
wireless subnet:

  10.1.4.1    00:0d:b9:53:ea:3c    PC Engines GmbH
  10.1.4.2    b0:7f:b9:50:5b:21    NETGEAR

any idea what is going on?


