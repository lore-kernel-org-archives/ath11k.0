Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D52BE7717F
	for <ath11k@archiver.kernel.org>; Tue, 17 Dec 2024 17:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g1hrCVwsLDHFXBw9S8SSEtW44ND3hIe5hEs7mvzMcv0=; b=UBbUKlcgEpSOKwIMvOD2Mshje4
	d1/Rn90ZIoHZHwkYz1uB66dp940V4RTXVptsAXUvLOQ2IcN3gWxHJ0jg6Iemkdtixv1k9NsdUWlNF
	wbY9HTd9+3zCCy5jch0DIWljhxFpjGlTWWhLu8zCkLt4wrRpyWUetIoT1zK3LB4S1YOZAc5zmrYJR
	m4+vAjJGsyut/QYnPePDobnQwqjoWCicsbBApJeIS3Cv+EV4cYsBrOtzUvbgf4hU3jCjzAce7pORb
	JIO9Ryo/apZqludPzAtYAktLONPoVsS1OZ+VY176AxJ1hixGt7Ru/eqYEWn7JhowtS8kI4AwUhqL9
	f7M5RxQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNbR8-0000000ELrU-1QiW;
	Tue, 17 Dec 2024 17:32:46 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNbOL-0000000ELCX-2Ctm;
	Tue, 17 Dec 2024 17:29:54 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHHJOLq032407;
	Tue, 17 Dec 2024 17:29:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=g1hrCVwsLDHFXBw9S8SSEtW44ND3hI
	e5hEs7mvzMcv0=; b=cl9r35o36KsL7jJKYCoj5LWAqgbCAwKQJ20PeY0lNPC00K
	Wb2kXbck5OilzEheJEhO1UdwI+su1vwZEx+ymJ0mFVZPhk383HWoO7VUfjl4QPyC
	NRZU5GuH7HUeI7pIrbgheTo3G3YyL9iJUTzTdJ2rQy11ZZUXxk/oz1ZsT4ro/HXW
	RF1p1weL++6yCLkAsXqi4doi+5uKWL9CuTqE9RqoY9qtQhM5eVDQSPo42O2F/pZf
	1E2hEAM56w/Zk8qrE4sU++MACbkaEvxnTnuSkGX19AfN+yNNhecbQM6ZfMsHhRv0
	9OFeYY0UtsvX1JEiQmcTgZp6vrtBDv/o0B5nndaw==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43k5g2jmnp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 17:29:14 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHDmDdx014412;
	Tue, 17 Dec 2024 17:29:03 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 43hq21kfhm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 17:29:03 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BHHT0u259441574
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Dec 2024 17:29:00 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0EEE820040;
	Tue, 17 Dec 2024 17:29:00 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E39DD2004B;
	Tue, 17 Dec 2024 17:28:58 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.155.204.135])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 17 Dec 2024 17:28:58 +0000 (GMT)
Date: Tue, 17 Dec 2024 18:28:57 +0100
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,
        Jozsef Kadlecsik <kadlec@netfilter.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Julia Lawall <Julia.Lawall@inria.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>, Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>, Ofir Bitton <obitton@habana.ai>,
        Oded Gabbay <ogabbay@kernel.org>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jeroen de Borst <jeroendb@google.com>,
        Praveen Kaligineedi <pkaligineedi@google.com>,
        Shailend Chand <shailend@google.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        James Smart <james.smart@broadcom.com>,
        Dick Kennedy <dick.kennedy@broadcom.com>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Jens Axboe <axboe@kernel.dk>, Kalle Valo <kvalo@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jack Wang <jinpu.wang@cloud.ionos.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>,
        Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>,
        Joe Lawrence <joe.lawrence@redhat.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Louis Peens <louis.peens@corigine.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org, cocci@inria.fr,
        linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
        dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
        linux-scsi@vger.kernel.org, xen-devel@lists.xenproject.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-mm@kvack.org,
        linux-bluetooth@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
        live-patching@vger.kernel.org, linux-sound@vger.kernel.org,
        oss-drivers@corigine.com, linuxppc-dev@lists.ozlabs.org,
        Anna-Maria Behnsen <anna-maria@linutronix.de>
Subject: Re: [PATCH v3 02/19] coccinelle: misc: Add secs_to_jiffies script
Message-ID: <Z2G02RN7VelcrjNT@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <20241210-converge-secs-to-jiffies-v3-0-ddfefd7e9f2a@linux.microsoft.com>
 <20241210-converge-secs-to-jiffies-v3-2-ddfefd7e9f2a@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210-converge-secs-to-jiffies-v3-2-ddfefd7e9f2a@linux.microsoft.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: fnzByXeLFO0AZ_AJF8SbPJqhCHN_hCrL
X-Proofpoint-GUID: fnzByXeLFO0AZ_AJF8SbPJqhCHN_hCrL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 phishscore=0 clxscore=1011 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 spamscore=0 mlxlogscore=985 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_092953_678771_8F15291C 
X-CRM114-Status: GOOD (  20.75  )
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

On Tue, Dec 10, 2024 at 10:02:33PM +0000, Easwar Hariharan wrote:

Hi Easwar,

> This script finds and suggests conversions of timeout patterns that
> result in seconds-denominated timeouts to use the new secs_to_jiffies()
> API in include/linux/jiffies.h for better readability.
> 
> Suggested-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> ---
>  scripts/coccinelle/misc/secs_to_jiffies.cocci | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/scripts/coccinelle/misc/secs_to_jiffies.cocci b/scripts/coccinelle/misc/secs_to_jiffies.cocci
> new file mode 100644
> index 0000000000000000000000000000000000000000..8bbb2884ea5db939c63fd4513cf5ca8c977aa8cb
> --- /dev/null
> +++ b/scripts/coccinelle/misc/secs_to_jiffies.cocci
> @@ -0,0 +1,22 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +///
> +/// Find usages of:
> +/// - msecs_to_jiffies(value*1000)
> +/// - msecs_to_jiffies(value*MSEC_PER_SEC)
> +///
> +// Confidence: High
> +// Copyright: (C) 2024 Easwar Hariharan, Microsoft
> +// Keywords: secs, seconds, jiffies
> +//
> +
> +virtual patch
> +
> +@depends on patch@ constant C; @@
> +
> +- msecs_to_jiffies(C * 1000)
> ++ secs_to_jiffies(C)
> +
> +@depends on patch@ constant C; @@
> +
> +- msecs_to_jiffies(C * MSEC_PER_SEC)
> ++ secs_to_jiffies(C)

If you used this script only, then it did not seem to recognize line arch/s390/mm/cmm.c:207

	mod_timer(&cmm_timer, jiffies + msecs_to_jiffies(cmm_timeout_seconds * MSEC_PER_SEC));

Thanks!

