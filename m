Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63D0C4167B
	for <ath11k@archiver.kernel.org>; Tue,  5 Dec 2023 15:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NHebt4j7s8OHV/xuSCmvZsKFeNjOFLQ9DgYPRv6+6O8=; b=lJwGdbN75txDXYU7ocE4S/ZSrP
	XGGQIclgMub6EqHyC/febC6iGkpdPSLvSFQA0faaJmCQcdmZ8y4+YpDpZML0+XN79Wqn2mjOseIfD
	w4VwukikT8812KZgxXVzqzHjaeIcd5gt3x78KzX9arP5D4vB+lREJ+3k0Q+SypfYPol2U8I6OPBUW
	6CgL19hUrVt4zIvTrvz2ZE4BeRP5cl5DnRDweT0Fh+MYmUVPNfEa7AGGyKuY7++zi5vIc0zPn8ctZ
	/uWr0mMC/cRVwBcZ95I30n0D6AeQm2Mv4isYY4ma8e/wrUEjbQWhtt5khC/65BkljgyWlWMWNjkbu
	iLUDidrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAXco-007nEr-1V;
	Tue, 05 Dec 2023 15:46:18 +0000
Received: from omta38.uswest2.a.cloudfilter.net ([35.89.44.37])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAXcl-007nDl-39
	for ath11k@lists.infradead.org;
	Tue, 05 Dec 2023 15:46:17 +0000
Received: from eig-obgw-5004a.ext.cloudfilter.net ([10.0.29.221])
	by cmsmtp with ESMTPS
	id ABE3rxS41Vly7AXcXroIXp; Tue, 05 Dec 2023 15:46:01 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id AXcWr3nNb11XZAXcWrMYRe; Tue, 05 Dec 2023 15:46:01 +0000
X-Authority-Analysis: v=2.4 cv=Z+v/oVdA c=1 sm=1 tr=0 ts=656f45b9
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=c601a17RXwP2wWhsnozrzA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=e2cXIFwxEfEA:10 a=wYkD_t78qR0A:10 a=COk6AnOGAAAA:8
 a=VwQbUJbxAAAA:8 a=WzuJIX3iUC1USL5IvykA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NHebt4j7s8OHV/xuSCmvZsKFeNjOFLQ9DgYPRv6+6O8=; b=agnQBn/dUEGSq49ZF5VM6/Hc5V
	oNj2qa1gF12KYyLZcjOYvrvEAXdz1UHWYuUXA4oJin0nC6v4u/1qHh0/J8C20uocjWAJaUdZcqlzo
	Gm8t1qk/21heW3MfKbeq2WcLwEfrJ+uDVZMJjYY++n3rm1uzrJttTuIo3HH9QwCsiPMDM0g2sezyQ
	2X/DPIH+2da/DguJp2tjp5t8QckBJxTk7FCSLO5l1N3zZHKXaDwYBOq9Lg90v9iNOTjrN7n0b7Lvx
	HQRS0xoN1uZzJkkS2PIX9kWPywG7ZNmG6eaG1zhI2xX8yRpzDKuh1CJGoUvm8vkNqFMKe/o0nYcWQ
	fu9IL+8w==;
Received: from 187.184.159.186.cable.dyn.cableonline.com.mx ([187.184.159.186]:42509 helo=[192.168.0.10])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1rAXcV-000tVE-31;
	Tue, 05 Dec 2023 09:46:00 -0600
Message-ID: <30ea9d68-e49e-4727-88aa-547b1b0feebf@embeddedor.com>
Date: Tue, 5 Dec 2023 09:45:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] wifi: ath11k: Use DECLARE_FLEX_ARRAY() for
 ath11k_htc_record
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Kees Cook <keescook@chromium.org>, ath10k@lists.infradead.org,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231127-flexarray-htc_record-v1-0-6be1f36126fd@quicinc.com>
 <20231127-flexarray-htc_record-v1-4-6be1f36126fd@quicinc.com>
 <4f2a486c-c6de-43e4-8bb6-bdd3f819b0a9@embeddedor.com>
 <c5555ad6-6991-4fca-864f-355d2fae9ae1@quicinc.com>
 <87edg0pt17.fsf@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <87edg0pt17.fsf@kernel.org>
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
X-Exim-ID: 1rAXcV-000tVE-31
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187.184.159.186.cable.dyn.cableonline.com.mx ([192.168.0.10]) [187.184.159.186]:42509
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfFW2q0+KLdRYs7yNGmQNEQshSBsrMQLyrjAgDX6gtwl8xOHJ15I7bVZUv1wtJSM5x9tScV4V4ajzrwWJyxWqyayfUUIHJU/NQoWr3KWcxY2FtU5EiBZG
 /htSLJbqlSPPx8xtdrkMoxpuJDHXC0pSyYesbXgYTgYbzzpf7IbUxG8taC/Sgu3ifG9toKBkmFF+VRJoTDmEJ+fJH8HP8lKoBheAauPxRJpq7Iuaj/i6bhBS
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_074616_087808_D40EB1B9 
X-CRM114-Status: UNSURE (   9.78  )
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



On 12/5/23 09:29, Kalle Valo wrote:
> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
> 
>> On 11/27/2023 8:23 AM, Gustavo A. R. Silva wrote:
>>
>>>
>>>
>>> On 11/27/23 10:14, Jeff Johnson wrote:
>>>> Transform the zero-length array in ath11k_htc_record into a proper
>>>> flexible array via the DECLARE_FLEX_ARRAY() macro. This helps with
>>>> ongoing efforts to globally enable -Warray-bounds.
>>>>
>>>> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>>>> ---
>>>>    drivers/net/wireless/ath/ath11k/htc.h | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/net/wireless/ath/ath11k/htc.h b/drivers/net/wireless/ath/ath11k/htc.h
>>>> index 84971cc9251c..e0434b29df70 100644
>>>> --- a/drivers/net/wireless/ath/ath11k/htc.h
>>>> +++ b/drivers/net/wireless/ath/ath11k/htc.h
>>>> @@ -151,7 +151,7 @@ struct ath11k_htc_credit_report {
>>>>    struct ath11k_htc_record {
>>>>    	struct ath11k_htc_record_hdr hdr;
>>>>    	union {
>>>> -		struct ath11k_htc_credit_report credit_report[0];
>>>> +		DECLARE_FLEX_ARRAY(struct ath11k_htc_credit_report, credit_report);
>>>>    	};
>>>
>>> Why not removing the `union` and just do a direct transformation [0] -> [ ] ?
>>
>> No reason other than staying consistent with ath10k.
>> Will see if Kalle has an opinion on this.
> 
> Yeah, I don't see the need for the union and I removed it in the pending
> branch:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=a2faeea1fe0635563187e7821a6d0baf7b40f2c6
> 
> Does it look ok?
> 

Nope.

A direct transformation is just fine:

-	union {
-		struct ath11k_htc_credit_report credit_report[0];
-	};
+	struct ath11k_htc_credit_report credit_report[];

There is no need for DFA in this situation.

Thanks
--
Gustavo

