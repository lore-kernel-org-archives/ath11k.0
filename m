Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03411C4167B
	for <ath11k@archiver.kernel.org>; Tue,  5 Dec 2023 21:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ELdMRvfVbTlW4kh57y4d7piETNWbebEO5+bLxPrF7YA=; b=V/4R7oe8ObW9swvxFAB9RJiC0Z
	+QawDSFhfw21dALl0PP7B3wbxsLSgey2sQXihD5L5cLalyup873locEMQLuX2yg6JqNKiRxOgY9/G
	XSJ+r/lp7+LvCc7jWOldxCDWB9BMbhvka2VETXyguHAxCda/ufGBgEu8Zz6l7sOps5D4UKINlzA4l
	Q+5PtdvYwLz+dsPrIpI5O9krrFFB1QOuMTlf3xH9EojGqUSjbWhGzpylM5O6k1RDF+SrAFz9yNuyw
	qOSYJJQNjC9eJNUSGNFsKudL1HqwIuSKok1Og6pBsG1ELyv3AyBxtMq6hiVwgm2/fUwxtpAlndCIw
	4WCVMQeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAcc4-008PXo-27;
	Tue, 05 Dec 2023 21:05:52 +0000
Received: from omta040.useast.a.cloudfilter.net ([44.202.169.39])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAcc2-008PXG-0J
	for ath11k@lists.infradead.org;
	Tue, 05 Dec 2023 21:05:51 +0000
Received: from eig-obgw-5003a.ext.cloudfilter.net ([10.0.29.159])
	by cmsmtp with ESMTPS
	id Ab7yr8AKX6nOZAcbzrCYqW; Tue, 05 Dec 2023 21:05:47 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id AcbxrBi2pnCfvAcbyrl1fS; Tue, 05 Dec 2023 21:05:46 +0000
X-Authority-Analysis: v=2.4 cv=KKpJsXJo c=1 sm=1 tr=0 ts=656f90aa
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=c601a17RXwP2wWhsnozrzA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=e2cXIFwxEfEA:10 a=wYkD_t78qR0A:10 a=COk6AnOGAAAA:8
 a=VwQbUJbxAAAA:8 a=WpM5r4VfDJVWwtKGMAgA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ELdMRvfVbTlW4kh57y4d7piETNWbebEO5+bLxPrF7YA=; b=GCJobkARQ6TF4IAWotopoUVOpf
	/EQA2Dc/8TfM/qBS7oBrxg4wOG44/4m03M3aCDiTXDExUH5de8o+3ErsK7IYSy+f3wmlIRslsDmht
	1HnI3uXcvu0W6QPvk88XNe99o0ELx4wGxXUofvpwCyDRuqcYMY6rKgCHA1mKqRe9jnXVW94gMKaxP
	d1Oe1tdsXWNmWQzOzWrZSWHmYImFZdnm/aM4o+E+otDrGBwq3LNvdMZjVz8SUE8eBsOyJXRa1BhjR
	G2JD1zMlg0ZkoZwCsxl8vOXYRTiNhVkdHSSZGrjCuMWNuc/Ut328cMSdbQE8QPnD2DWYhVzjJs0I2
	Ets8AZWw==;
Received: from 187.184.159.186.cable.dyn.cableonline.com.mx ([187.184.159.186]:21005 helo=[192.168.0.10])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1rAcbx-001EZc-0n;
	Tue, 05 Dec 2023 15:05:45 -0600
Message-ID: <7ac54136-28a2-4ee4-ab10-4c52134bb515@embeddedor.com>
Date: Tue, 5 Dec 2023 15:05:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath11k: Fix ath11k_htc_record flexible record
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Kalle Valo <kvalo@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Kees Cook <keescook@chromium.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231205-flexarray-htc_record-v2-1-fbb56d436951@quicinc.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20231205-flexarray-htc_record-v2-1-fbb56d436951@quicinc.com>
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
X-Exim-ID: 1rAcbx-001EZc-0n
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187.184.159.186.cable.dyn.cableonline.com.mx ([192.168.0.10]) [187.184.159.186]:21005
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKoOgwiHhJu0cXI4LypVKiZ5BD3eSB8pGHwbZ1J0yG85K3WrSJy1KJyKmJ1n3NrEp0IiFj0TZQirJLOEl7AANU1mummcMKB6NS4Na6/qhpWvI9Sv/KSK
 1qZCCbzwxyHdjC9GUh3+h2cY4nisIWANNvKX0+YArrc9XF4DNr9EcvbiRLsMzfcRRlCv15z/lu5TwmHjU0ItWEygDGdN1FVORO8uHQf9Pm1HWzg4NPYVB/RD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_130550_244042_44A476CB 
X-CRM114-Status: GOOD (  10.31  )
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



On 12/5/23 15:00, Jeff Johnson wrote:
> Transform the zero-length ath11k_htc_record::credit_report array into
> a proper flexible array. Since this is the only array in
> ath11k_htc_record, remove the unnecessary union.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks!
--
Gustavo

> ---
> Changes in v2:
> - Original patches 1/4 2/4 3/4 already accepted
> - This is original patch 4/4, updated to incorporate Gustavo's review
>    comment, removing the `union` and just do a direct transformation
>    [0] -> [ ]
> - Link to v1: https://lore.kernel.org/r/20231127-flexarray-htc_record-v1-0-6be1f36126fd@quicinc.com
> ---
>   drivers/net/wireless/ath/ath11k/htc.h | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/htc.h b/drivers/net/wireless/ath/ath11k/htc.h
> index d5864a35e75b..86f77eacaea7 100644
> --- a/drivers/net/wireless/ath/ath11k/htc.h
> +++ b/drivers/net/wireless/ath/ath11k/htc.h
> @@ -151,9 +151,7 @@ struct ath11k_htc_credit_report {
>   
>   struct ath11k_htc_record {
>   	struct ath11k_htc_record_hdr hdr;
> -	union {
> -		struct ath11k_htc_credit_report credit_report[0];
> -	};
> +	struct ath11k_htc_credit_report credit_report[];
>   } __packed __aligned(4);
>   
>   enum ath11k_htc_svc_gid {
> 
> ---
> base-commit: c8a5f34ad811743d1b3aeb5c54198eebd413bc6d
> change-id: 20231116-flexarray-htc_record-ae46f039d4bf
> 

