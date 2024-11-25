Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644CBD3B7FF
	for <ath11k@archiver.kernel.org>; Mon, 25 Nov 2024 10:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o5uBdUNquJHQi73QLveWVA003LlbDdqxpHsFv6U4gJk=; b=mRMzP85/fQzO3b1XEqxTTuOyxe
	ptG+4RRxzFo1P0xjqbTBLhvnc/anRSZN0gtCHQkeWLPp+2H9TR3nQQW1VqgTP2/4uzn7jI1qYbV77
	vrpeOivEwKQML/jseLwAWpNTvKnAggvDfCXnaQR601JcKblkq/NUfvKiX/8z7B65iv62aUJJCyIcG
	359qZweAyrncccCUEi+clR51rw6v3iUD3DM9QL3lopfFYbfi4C3zgsv2dJ04auPco6ROeMb7kYb9V
	77CJAu6jttPQw3JODkPfatEgVJ8h0JngcHBNK68eth2p9nQJvNDdi8wR3bbd5JxaqAwaoTUZBwPgU
	FzfWLN5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFWQT-00000007luq-2KGi;
	Mon, 25 Nov 2024 10:34:41 +0000
Received: from mout.web.de ([212.227.15.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFWQQ-00000007lt5-3PEa
	for ath11k@lists.infradead.org;
	Mon, 25 Nov 2024 10:34:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1732530874; x=1733135674; i=markus.elfring@web.de;
	bh=o5uBdUNquJHQi73QLveWVA003LlbDdqxpHsFv6U4gJk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=STtYNeC+4S2OY7xY0j8ADS41ii3BPoBv0NT7SrIY15nQYTtmiCjtrpdt8jCPTnJu
	 LLmUq7Wy9P3yahea5ZPn4ABuNnMx5kkKymhKbxyy8HQQuLQgpOWuMbWtQvHvZ0RRL
	 E07VS5qZB2QScHfMBUBEnz7il0ShJ41DQL/SSVu4uB5p56c6sMoq5IfXrMWXSi4Ro
	 pStE28PpIW7GGN1AmXuB8kO3uMLG6rWtD/ePEVG0NuuZVBvJhx4C7ouPb5ACO3ElT
	 KNAsfSW920xXC6JhFQbWcsfZRA5Lgw2iIZpEeHC9ymtSp2HCh1K+pOMcK/vYCxTMs
	 RWm87IsaaNfl1xAWxg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.86.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mvbms-1tWdps0fTS-00xmj5; Mon, 25
 Nov 2024 11:34:34 +0100
Message-ID: <4b1b5c12-3f81-4004-8eb4-44a9fbcc7223@web.de>
Date: Mon, 25 Nov 2024 11:34:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Baichuan Qi <zghbqbc@gmail.com>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, Kalle Valo <kvalo@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Jeff Johnson <jjohnson@kernel.org>
References: <20241125050821.149898-1-zghbqbc@gmail.com>
Subject: Re: [PATCH] wifi: ath11k: Fix NULL pointer check in
 ath11k_ce_rx_post_pipe()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241125050821.149898-1-zghbqbc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cfbrid79ZOOhMehvtKDGQKtUSMXSepXT7yOaAZtWsXb4rsacPum
 pMu8e+zzii/u/AQQIBAPoMJlBZQNZsJvm/7UM5gZCxUn4GIaA3O14pHAmIC05xR9qEcNsmk
 6GjOXERidan28guytZr+bfYkPuBvAHX8EIRvU2nAiGNhTZNjbV+EseOyreSwbRTa14n/0FO
 Z58Q3EEYgjKd6pi1h5MDA==
UI-OutboundReport: notjunk:1;M01:P0:C2ka7QxYyTo=;k8m90meHyNDXyM/15IQtzhWnEqX
 SZnN8EAfxV7CgecGoqb/VDdFBt/VU/G5XSDeCcex8MRKSy1P9ohd9ONWszvGxUBKwy7HPgHT3
 XmlsRoUvaP9mOD29cI+yeSpfOov2jvqDgPqqceAqHSDdUe95e371L148qOn016LBDPSgFbC+Q
 A7aVtT9PyrB46zRpfwnpwpHXYtIxEefYuv62VnFkf8RXuo5Imevt4pO6/cTNgo2ekeT6mQslt
 akXHQONnE5/hSwyZIBXbTVz4ap+cxq0CnE6op4VobCRPLheEYb2iNNV+dT485CsgRNDOsb2uN
 +V+w0+6DUoMN3RasgfvA0miFsy9RVhBd7/y6Wsqnz7bWNCk6PknM+KT8PZ0sNhYfZO8m1pcEh
 8Xk/mXHPmP+4Ooly4yZpHgT12JuRIr/Tw5SIKkjJ2+Pp6YCRSowoMZtKMJL86n+GnU0jQQLIp
 XQ3JHcLqBuqCZKzU/grZk6tIgDwQUe4xDvkpjpf+q1HzOpZK6k9UytErLCQlNP6owRz9/Fux/
 iTyANA4Tcb9PGW3BKaUd9apZJxmw04YSdcTVxLAQ3I4A+Qms+wQun7dvRRdwDcnTijlK/b5hx
 pUvolKzZ5321pTbCWvRHQ/4l5RAIuo21dKAZZ9bFNw1RHnu0GVu4eWyOkLLvjOArDW1DrW97w
 tWUUQmlNrzSJzde0bQcXdux0sGjS1oxHArLwXN5lWnsXuoqwigCQduic2h5E8Nq7XIgU42JbR
 /sVhthUu5xdtURJlPv0l05gMxPPGAQpSbE5Vhsuun09AKO8qHEutkNlR09+cnVKIyJfoasc1i
 iD6gtl8mDt7ddYabOyJi4I9YcWS3wNwJU0JcFI3m1r0vgGUIjO2ymW/nrl1LyGwG8KDZyyfNe
 0za2WxL1VKhtOVB1+ds99O/ZRIo0EfhqSNiWLr81xxZ0Wbm+GycOHEa9o
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_023439_214208_C279665A 
X-CRM114-Status: UNSURE (   3.35  )
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

> The previous code used OR for NULL pointer check, whitch can not
=E2=80=A6

                                                    which?


You may occasionally put more than 64 characters into text lines
for an improved change description.

Regards,
Markus

