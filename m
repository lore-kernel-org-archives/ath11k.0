Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852C2D68BD7
	for <ath11k@archiver.kernel.org>; Fri, 15 Nov 2024 21:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h0tYENsGaJFO8JDAStk6yXv0HXHF9Ts4iNM+HpTmVVA=; b=GVspuK0ie8CkVPIjFOtGjQHTGj
	cjHbK7tb95i3ldHQjrYv5QKjKBIO9Xf6KLPzVST6lobTjS6A5s4kYxvT5LqGwhs3M8Gm0LuzoDqYD
	wqqqIJpMmVzVSiFUPccmsjOMiELiRN8p/b48CffjgZuLvfFZoXzfZ7T9y/XW3xWm3kI5zieV3KPRS
	3ixBKn/Wk/vb1ZzuljLQFCopqFO5p5SkKoHLIGw/qnDT4JQnGdfGSc4RVpCUoCI0G5l7fhTSXelZ0
	rfMbiF3oQxwaowqIKMjhfjhMN2YeM+mLDNF8ZrtWsQAceKIoER4119IaRPz4FPiRfpJol2t/Wv/A2
	Ley1+KIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC3ue-00000004EX0-0pDO;
	Fri, 15 Nov 2024 21:31:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC3ub-00000004EVo-2pSI;
	Fri, 15 Nov 2024 21:31:30 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AFBRrRp005627;
	Fri, 15 Nov 2024 21:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h0tYENsGaJFO8JDAStk6yXv0HXHF9Ts4iNM+HpTmVVA=; b=ECCtKwq6Cy4NLuZL
	j2WUeZYNsdHGYwCwotl4/Q3JJFWUcWHz7gsSnNDB+iL7po1zl5LllV34Rd8BicSR
	9ZhaW0psyAjm90yO+xdBZAQR2N+BNsxWv7rLBNXjlQiIPWBa1yvitZRPCxTpPbfw
	Cg+cd7DCPZpNjEahimwlyHuvXlt8vqPlFUL5VktjnMqhWF5hDijj5bAtLxhAD0oc
	D1i3vFAs+GUMNPK5b3Rv4wJqmmGh4qZDucIdWFwnin1FB9/KAmxpYybkULOapKD8
	Gey6OqqdHevsuhCW6YMpiT4CXpP2hs6x9/0dOyqFe/2DN0Iw3Eca3M+RZSonp9bg
	YT7Xyw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42wex8wcg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 21:30:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AFLUgSW012417
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 21:30:42 GMT
Received: from [10.111.176.23] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 15 Nov
 2024 13:30:38 -0800
Message-ID: <e1ff4b71-7abf-4ac6-8b82-86aad5394de6@quicinc.com>
Date: Fri, 15 Nov 2024 13:30:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/22] jiffies: Define secs_to_jiffies()
To: Easwar Hariharan <eahariha@linux.microsoft.com>,
        Pablo Neira Ayuso
	<pablo@netfilter.org>,
        Jozsef Kadlecsik <kadlec@netfilter.org>,
        "David S.
 Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman
	<horms@kernel.org>,
        Julia Lawall <Julia.Lawall@inria.fr>,
        Nicolas Palix
	<nicolas.palix@imag.fr>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang
	<haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell
 King <linux@armlinux.org.uk>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily
 Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle
	<svens@linux.ibm.com>, Ofir Bitton <obitton@habana.ai>,
        Oded Gabbay
	<ogabbay@kernel.org>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo
 Vivi <rodrigo.vivi@intel.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jeroen de Borst <jeroendb@google.com>,
        Praveen Kaligineedi <pkaligineedi@google.com>,
        Shailend Chand
	<shailend@google.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        James Smart
	<james.smart@broadcom.com>,
        Dick Kennedy <dick.kennedy@broadcom.com>,
        "James
 E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>,
        Jens Axboe <axboe@kernel.dk>, Kalle Valo
	<kvalo@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jack
 Wang <jinpu.wang@cloud.ionos.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz
	<luiz.dentz@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui
	<rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal
 kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Xiubo Li
	<xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
        Josh Poimboeuf
	<jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>,
        Miroslav Benes
	<mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>,
        Joe Lawrence
	<joe.lawrence@redhat.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King
	<linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner
	<christian.gmeiner@gmail.com>,
        Louis Peens <louis.peens@corigine.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao
	<naveen@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>
CC: <netfilter-devel@vger.kernel.org>, <coreteam@netfilter.org>,
        <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <cocci@inria.fr>, <linux-arm-kernel@lists.infradead.org>,
        <linux-s390@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <intel-xe@lists.freedesktop.org>, <linux-scsi@vger.kernel.org>,
        <xen-devel@lists.xenproject.org>, <linux-block@vger.kernel.org>,
        <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>,
        <linux-mm@kvack.org>, <linux-bluetooth@vger.kernel.org>,
        <linux-staging@lists.linux.dev>,
        <linux-rpi-kernel@lists.infradead.org>, <ceph-devel@vger.kernel.org>,
        <live-patching@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <etnaviv@lists.freedesktop.org>, <oss-drivers@corigine.com>,
        <linuxppc-dev@lists.ozlabs.org>,
        Anna-Maria Behnsen
	<anna-maria@linutronix.de>,
        Michael Kelley <mhklinux@outlook.com>,
        Thomas
 Gleixner <tglx@linutronix.de>,
        Luiz Augusto von Dentz
	<luiz.von.dentz@intel.com>
References: <20241115-converge-secs-to-jiffies-v1-0-19aadc34941b@linux.microsoft.com>
 <20241115-converge-secs-to-jiffies-v1-22-19aadc34941b@linux.microsoft.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241115-converge-secs-to-jiffies-v1-22-19aadc34941b@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: h43h8EgANEiwtjVrnKtKVRWKc8bYM2XJ
X-Proofpoint-ORIG-GUID: h43h8EgANEiwtjVrnKtKVRWKc8bYM2XJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 phishscore=0 bulkscore=0 mlxlogscore=893 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1011 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411150180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_133129_719285_4EAD5052 
X-CRM114-Status: GOOD (  16.17  )
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

On 11/15/2024 1:22 PM, Easwar Hariharan wrote:
> secs_to_jiffies() is defined in hci_event.c and cannot be reused by
> other call sites. Hoist it into the core code to allow conversion of the
> ~1150 usages of msecs_to_jiffies() that either:
> 
>  - use a multiplier value of 1000 or equivalently MSEC_PER_SEC, or
>  - have timeouts that are denominated in seconds (i.e. end in 000)
> 
> It's implemented as a macro to allow usage in static initializers.
> 
> This will also allow conversion of yet more sites that use (sec * HZ)
> directly, and improve their readability.
> 
> Suggested-by: Michael Kelley <mhklinux@outlook.com>
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Reviewed-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> Link: https://lore.kernel.org/all/20241030-open-coded-timeouts-v3-1-9ba123facf88@linux.microsoft.com

your signed-off-by should be last.

and you have a patch ordering problem since this patch must come before all
the patches that use secs_to_jiffies(), otherwise this series cannot be bisected


