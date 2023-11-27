Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5157AC4167B
	for <ath11k@archiver.kernel.org>; Mon, 27 Nov 2023 16:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1zuuto7VzH05oC9wYeQVZJK2PnoHCCdOM0tBHc47dG0=; b=R+N7IVtDQUhC6z
	vILsWZhPhz3PtWa9OfsU8YrV0BD9pCLX5Sh3VmLZJVzrG/neeV88+du/rA/pFDjjJ4cOnh+rjWFXT
	9c4wZ5fKQ3IgmK+DAlA3Ze4G4/vIdWMCfaTfseLzVuzDmZbn+A0s3eltqaCYJZwPb9AGUzeeXIePN
	zeIeZm/T4l9+mij+OAZRcmC18q8NTgNuthzrHrxx4WtDaqIHe1sNIV7B8jcEM26eE91fVV+s00yWs
	R7qLR772tbCt7lHn2wQfHdhvfpCaTKrfBbOhseCGzhRNTLLEUHFJ31KMo0FyVlsRhzPFS7dasF6ab
	aumu2e0iVkrTVRO/HFtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7eWI-002zoT-06;
	Mon, 27 Nov 2023 16:31:38 +0000
Received: from omta40.uswest2.a.cloudfilter.net ([35.89.44.39])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7eWF-002zf4-0Y
	for ath11k@lists.infradead.org;
	Mon, 27 Nov 2023 16:31:36 +0000
Received: from eig-obgw-6008a.ext.cloudfilter.net ([10.0.30.227])
	by cmsmtp with ESMTPS
	id 7dINr4emiL9Ag7ePFrdhM7; Mon, 27 Nov 2023 16:24:21 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id 7ePDrJNhW0xkr7ePDrqnJT; Mon, 27 Nov 2023 16:24:19 +0000
X-Authority-Analysis: v=2.4 cv=N7U6qkxB c=1 sm=1 tr=0 ts=6564c2b3
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=yGeM7+xMb5a5VK1DGQx1ew==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=BNY50KLci1gA:10 a=wYkD_t78qR0A:10 a=COk6AnOGAAAA:8
 a=VwQbUJbxAAAA:8 a=cZ1y5YrqKnYO-lcvaXwA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ajao1Jnn7rZAIQCXWTuZsvkXWk7j/Z+TfVN0RYSP0wU=; b=pcYsISPEpb1XsR9h0DjQubZKyp
	o7tiByOzumhzWSjaNc/69UOljmCQD1wJa5Go6tX9aWp9twlNfAIFdtsKNKEhS2aJZG7NfZ6qTlkOW
	Rknzcs6/QYUrTIWs7VTw+QG6XSR86qZy0LZPW6KUFDyUlFCB+jnRTzuW9X2c5EG4pCPtXg6c0dmuN
	D/Yq/DIdbUZO+eQgllqVRKuM2iJBDoEPv+F01qkZ4fWbX2fE1i6LAr5Ff6gt6dzMF8TRk2eAAWB0L
	FeLPAsZzUWF0ouV2jS6IuoBJVaiHyz85ucq7KGpQUNr6w2ujnsPK1UXHxu9+h1CQ3B9GIyym2QXVs
	STGGsM4A==;
Received: from 187.184.157.122.cable.dyn.cableonline.com.mx ([187.184.157.122]:35864 helo=[192.168.0.9])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1r7ePC-003aet-1f;
	Mon, 27 Nov 2023 10:24:18 -0600
Message-ID: <99b98f17-3cb2-4658-b183-a0c9d6709d6f@embeddedor.com>
Date: Mon, 27 Nov 2023 10:24:16 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] wifi: ath10k: Use DECLARE_FLEX_ARRAY() for
 ath10k_htc_record
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Kalle Valo <kvalo@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Kees Cook <keescook@chromium.org>, ath10k@lists.infradead.org,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231127-flexarray-htc_record-v1-0-6be1f36126fd@quicinc.com>
 <20231127-flexarray-htc_record-v1-2-6be1f36126fd@quicinc.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20231127-flexarray-htc_record-v1-2-6be1f36126fd@quicinc.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.184.157.122
X-Source-L: No
X-Exim-ID: 1r7ePC-003aet-1f
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187.184.157.122.cable.dyn.cableonline.com.mx ([192.168.0.9]) [187.184.157.122]:35864
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 11
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNhbzVIlWsZIO6h0tGmTqimQzlfTnR6X+tHFovN4yA0ZDPS6DWZA/xqLjDKiOj1Jr+BA1HwqsnPjKiQlzgCNA/k/RUiBh8IgWyHnqzcQQD/zcX3T9XSj
 jrNOqeAdyTPD36lwDDEJLarxoY2bMHp9j9hM2YEm9tVd2Ud+K2cqGay/LpAvgB/74SLF/gaoIjQSN0rdkU1TCZO+/knQdRS92pd4tcvTOC0oqukYADnc/aqg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_083135_238346_F207AD08 
X-CRM114-Status: UNSURE (   9.06  )
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



On 11/27/23 10:14, Jeff Johnson wrote:
> Transform the zero-length arrays in ath10k_htc_record into proper
> flexible arrays via the DECLARE_FLEX_ARRAY() macro. This helps with
> ongoing efforts to globally enable -Warray-bounds.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
--
Gustavo

> ---
>   drivers/net/wireless/ath/ath10k/htc.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/htc.h b/drivers/net/wireless/ath/ath10k/htc.h
> index 9cbb901d35e5..c6c392f8630c 100644
> --- a/drivers/net/wireless/ath/ath10k/htc.h
> +++ b/drivers/net/wireless/ath/ath10k/htc.h
> @@ -246,9 +246,9 @@ struct ath10k_htc_lookahead_bundle {
>   struct ath10k_htc_record {
>   	struct ath10k_ath10k_htc_record_hdr hdr;
>   	union {
> -		struct ath10k_htc_credit_report credit_report[0];
> -		struct ath10k_htc_lookahead_report lookahead_report[0];
> -		struct ath10k_htc_lookahead_bundle lookahead_bundle[0];
> +		DECLARE_FLEX_ARRAY(struct ath10k_htc_credit_report, credit_report);
> +		DECLARE_FLEX_ARRAY(struct ath10k_htc_lookahead_report, lookahead_report);
> +		DECLARE_FLEX_ARRAY(struct ath10k_htc_lookahead_bundle, lookahead_bundle);
>   	};
>   } __packed __aligned(4);
>   
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
