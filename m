Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED94C4167B
	for <ath11k@archiver.kernel.org>; Wed,  6 Dec 2023 21:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z89JbXvFtxvpHgG4/D9TvUPfBOX7E1w1eYXh8GBdDDg=; b=u3Yd4oDcqyVHRBtYE/LZFwpjoo
	6YQgnvCrtePlb/gVNLM8VEfEGBPFPvpSdvJw3ls5kN9qsz8n2v5NQ21ibP0T2VpErtwHGtGgIEqbr
	h5qACaTy8sBI4kV5NlevnasiHcZmEAtu3zYS6SBv+OBtk24Dt7aElV6gP5aXlA9X2KJiH/yxcnsko
	E4qKpsMuiEQEBvHwtwWCxv3vtBl0RonsQ5CM/ALaJ5WEDivUBYkFwRBAuUJHnqd4/sdJIx/wNANZP
	BzfajuXo0NwzdbDy4KOGXrXdksVZrA7j1oKUQ3BSJDBJTLEEL/mQlWbhnjtnLlLAfXumLbmAPqfnA
	hfl2OcsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAzN3-00BJIy-0d;
	Wed, 06 Dec 2023 21:23:53 +0000
Received: from omta034.useast.a.cloudfilter.net ([44.202.169.33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAzMz-00BJG0-0v
	for ath11k@lists.infradead.org;
	Wed, 06 Dec 2023 21:23:51 +0000
Received: from eig-obgw-6006a.ext.cloudfilter.net ([10.0.30.182])
	by cmsmtp with ESMTPS
	id AxHrrpQdOjtZ3AzMtrv731; Wed, 06 Dec 2023 21:23:43 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id AzMkrYAPQGKIcAzMkrhvhY; Wed, 06 Dec 2023 21:23:34 +0000
X-Authority-Analysis: v=2.4 cv=E+beGIRl c=1 sm=1 tr=0 ts=6570e656
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=c601a17RXwP2wWhsnozrzA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=e2cXIFwxEfEA:10 a=wYkD_t78qR0A:10 a=COk6AnOGAAAA:8
 a=VwQbUJbxAAAA:8 a=_Wotqz80AAAA:8 a=cm27Pg_UAAAA:8 a=jzDRcfw_wAzovSFxW3EA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=AjGcO6oz07-iQ99wixmX:22
 a=buJP51TR1BpY-zbLSsyS:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Z89JbXvFtxvpHgG4/D9TvUPfBOX7E1w1eYXh8GBdDDg=; b=wK+2HNzmisO4AOviFMz6pFLxZv
	x5za6lFwlYdRe0LTXGbkDAoy3uHP03x6WQMPjzUArkHQFU0vlSa6f/cgkDrqkorNWDTOpgZxxd+MO
	aUwSlLvSKv0H1BHTwaeTW1BK5/af50yVTOUPQDZasXrXtsFAG4ayPBekTLlXaNli0XkKUpza0ds06
	WxHbLiW5h7IWvo/jp4EZtKYuz3ms8ahCOG1qbgcxMw9qJNJFw1UjIGgFs/DqHUtanU/5NSiBPVc5z
	bv4cLz47JSY4+1cxw4iAmoyny7Ppr5MGLGoP2cfmQsOAccFpbBJAL4369hZ5kQZ7kperBj30ANg9n
	nIfaBQQw==;
Received: from 187.184.159.186.cable.dyn.cableonline.com.mx ([187.184.159.186]:15648 helo=[192.168.0.10])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1rAzMj-002Gl6-1K;
	Wed, 06 Dec 2023 15:23:33 -0600
Message-ID: <69be3198-16f1-45ec-8262-1ed269f1f6ea@embeddedor.com>
Date: Wed, 6 Dec 2023 15:23:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath11k: Fix ath11k_htc_record flexible record
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, "Gustavo A. R. Silva"
 <gustavoars@kernel.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231205-flexarray-htc_record-v2-1-fbb56d436951@quicinc.com>
 <202312061254.085B4755@keescook>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <202312061254.085B4755@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.184.159.186
X-Source-L: No
X-Exim-ID: 1rAzMj-002Gl6-1K
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187.184.159.186.cable.dyn.cableonline.com.mx ([192.168.0.10]) [187.184.159.186]:15648
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfPCrOAZDcL8ogeVMX5TiGUjd1cWhGJ80kKx8Lmg3YZXuw5pJ/Cd7Dp7FUhOn4s7gvCYaiI1vMDg6Ap/Z7oFcjORQVAm3TpLncJfJ0EQLfihh0zMc49Ln
 oj1RcNL4DfgyWEvHZ3a6BJ60oo7yYWVQKe/XpGUVii20dS7cCl69fuaI73GcASrjhQsfhus9SdVr0PduxN1NFGdTH6rXbU0yY2b4T/LZlPAWYkXwlIAW/s0r
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_132349_408115_D5E98A20 
X-CRM114-Status: UNSURE (   4.05  )
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



On 12/6/23 14:55, Kees Cook wrote:
> On Tue, Dec 05, 2023 at 01:00:17PM -0800, Jeff Johnson wrote:
>> Transform the zero-length ath11k_htc_record::credit_report array into
>> a proper flexible array. Since this is the only array in
>> ath11k_htc_record, remove the unnecessary union.
>>
>> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> 
> Heh, looks good. I wonder why this was a union to begin with?

It used to contain a couple of members:

https://lore.kernel.org/linux-wireless/20231127-flexarray-htc_record-v1-3-6be1f36126fd@quicinc.com/
https://lore.kernel.org/linux-wireless/4f2a486c-c6de-43e4-8bb6-bdd3f819b0a9@embeddedor.com/

--
Gustavo

> 
> Reviewed-by: Kees Cook <keescook@chromium.org>
> 

