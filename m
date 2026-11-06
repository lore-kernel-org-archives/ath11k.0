Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63345606A31B
	for <ath11k@archiver.kernel.org>; Fri,  6 Nov 2026 02:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mzdul3Eg;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W1vpMfHG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NNygTWAe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=btLkCHzI95QaiIhMfSZU8feJfkCOCp06xvLCxfxhQIc=; b=mzdul3EgXanb7H
	6zimud1xP2ZjL8hobCX7Of9DzQZudw3T6xBOj/lRxd/SzFBR6KZLXSLg7zaNJF6jcDd30zZxwI21P
	WmfkfqoqUtXrZeLHLd1fXeATI69wHmI3PPXlLP354mvx70c8LRvj0StYT+b4XoKjis2PyPpeQ4S18
	AbL3sdXHlLjCfX/eRhAAmQ6N6cQnEwk/vrELtTZaBtgHBRHVkqfzZJpDpI/R6YwKqJQeP0XhWdw9H
	rhV53PtOQActFcXgTriTxUUZX88nWUmxsLq2FGvv0TkPTUoe2NkX+zQeKxjNl/+UbUGBoaBt+yvvp
	ABS+4eInn0ujBcK3SG7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP9oy-0000000B5nL-35Rd;
	Fri, 06 Nov 2026 02:36:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP9ov-0000000B5n3-1mt7
	for ath11k@lists.infradead.org;
	Fri, 06 Nov 2026 02:36:50 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5NeSpw3295494
	for <ath11k@lists.infradead.org>; Fri, 6 Nov 2026 02:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	btLkCHzI95QaiIhMfSZU8feJfkCOCp06xvLCxfxhQIc=; b=W1vpMfHGgPo30HEJ
	9bBx8hzYIYAapGcKSKIpR+nLEmzKOOVclknMYKm4P5wuYj8zb6NFD5fFgpH/ptlC
	tCS6jvBGcygUoDWBXjKMLBd3ApLGl6sLxZplg7ksWa9wXhsjXchOqR4T97kRSmPC
	dH8Ih8hrBWzjQU5tWshRLhnGw4AMmTXndqwvrMq6DWe1tP2cok0dMuUDSwhvzc6L
	Bcg2WwhtMIkrj/eXcjlv+1vSMJlINS9HBwCy4BHzmVE4U42kZMv/7+m1OZePxU0h
	rPB1LI9avM4m3S9Jm+bS1AcGIloWR4beQ3fOraO2WpWiktSuGhIqARlD+wjHI3x9
	PrvglQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9rh9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 06 Nov 2026 02:36:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0a098dbc7so169879a91.2
        for <ath11k@lists.infradead.org>; Thu, 05 Nov 2026 18:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793932608; x=1794537408; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=btLkCHzI95QaiIhMfSZU8feJfkCOCp06xvLCxfxhQIc=;
        b=NNygTWAeDd3VUwPgtPS9XmnZZseQ8CtRuKnG+vxknP5EQTa3feD+6x0jUrwLkzvplw
         IDmL/06FXrAl73HW48rLbZiYpFGBsoUCaOdoWnw522g/tRxar9WGMJm5IFgUw2Z0Vqa2
         ELJX0ijenrASZnMoDyD6VMTlX1ZTf3VwYi8E3JX8dQWrv2x9g+lxJ/TsBlrqW8xMkBoV
         SPVxhYKoev9++dyHelZ3e6vds73KXhEZtczWA/EBHqh+K5bDduGx482WsUr1DEn5s8Zn
         9DdhCV0X0Rd6tPzguLKkvJxpUqqcPohWZ0q1YYC0jr9zcRy51ktew636HnDE+U1Tv1hi
         lJlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793932608; x=1794537408;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=btLkCHzI95QaiIhMfSZU8feJfkCOCp06xvLCxfxhQIc=;
        b=WAXN3q7XrFthSNTlLQyY7Ur+SdnW1pUbu80RjJj2k9iFHEwu3VoueM1qbhHg7FPqp8
         1mcs8HAw8VsBVNulwiKVrvEjAkfPZNVN/OkArQf2NtEiWI0B96PwrDogOPNtV1ufpZgC
         ofgdyUhw4ahrYyRB/yZLIQ7iv6C0OzJmBaYNNg4Nym8Bj+m70Yo14/9hrAJSXrUQ+8PR
         XTtufAsE+qk2GKj6BDXYl27n+sqGGORUMJdNBRhAs2fpTrdcj3W9b7lmkuCN426EWVAt
         QEe2Tnk/yJLlKK9AdAWP7bm+YXmf1cHFqLtaSFieJb+lpsF7w3cE2RslZ2d02crMoK3H
         R5eg==
X-Forwarded-Encrypted: i=1; AL+hErEbznUcgPEsjHMiaNeoXrQF/XlaGF9P/d7Utaw34CzHxmF+EgXf0rK6Zqn3BEtMVfGcpuhfHs0=@lists.infradead.org
X-Gm-Message-State: APuU4Z/HHd7UeRaNokaZpwk0fQ0rFR2Y79bXxte3xPKf7BGM0u0iML98
	T7YQWfPrzQXOhrKzdJ4J4ZJDQZbkafTA8VPfiwYKLnYuUBKVYxS/FpukhKdjwHKywlBHMMSFhsR
	UXpAEO8Qeypaao8zOvAbiGHSCAeTfmyKpn0uHTYbHdiSsQh2pdNVXCnWhgCF9TKO8
X-Gm-Gg: AYBFou0q6lHg3yZdFU8maOzZyjn+3lI9AyRwDeznB67uAo0aShM4uwtHukF6CFXmg9Q
	9/9s0ZQejaoj35jWH/HbXDcJsTy1H8hH/dcwqSaOewDnRDFGyIEJRlxlnaTwOq4bHVPqcuxx8ps
	NnNtdPGlcVOkQTR4/5iLml0oBFFUYK7nUJ0V85L39tL23m1kXvvKGMTeAO+QdytGKxXuigHnnm7
	Ehd1p1QUp3CFVkhGV6VMugSWHn7Kck83Hry1X6PL4j7f94PaVUFWmMEOJ9npgEahQH0NkyXr3NI
	TZR0nQIijJ7cqCZcGZfVKOB2AaGZ5E56UCRxo6i6gKUDo4r88h6WArz7JRHJJDFUb+7CaE7qzjp
	OkhSFjzWYaW4RzRMFOZ73SQDkwfMDGOEOOaz8ex1DLA9T0ksAMe5OX/LHssVrW9pdewWbQKx+Mz
	u2WMgQx6+iF2GryyyUAl3FCmMMhK/NuZnbMUJyP2an8/76
X-Received: by 2002:a17:90b:39ab:b0:3ae:a531:4e73 with SMTP id 98e67ed59e1d1-3b0db6210b3mr1026760a91.7.1793932607686;
        Thu, 05 Nov 2026 18:36:47 -0800 (PST)
X-Received: by 2002:a17:90b:39ab:b0:3ae:a531:4e73 with SMTP id 98e67ed59e1d1-3b0db6210b3mr1026728a91.7.1793932607031;
        Thu, 05 Nov 2026 18:36:47 -0800 (PST)
Received: from [10.133.33.112] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323cd3csm5753094a91.3.2026.11.05.18.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 18:36:46 -0800 (PST)
Message-ID: <d8f645d3-6648-45cb-934e-1b232b0f6896@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 10:36:42 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: Reject short management RX frames
To: Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
        Govindaraj Saminathan <quic_gsamin@quicinc.com>,
        Shashidhar Lakkavalli <slakkavalli@datto.com>,
        Ganesh Sesetti <gseset@codeaurora.org>,
        Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260926114037.3231795-1-yaojiale02@163.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260926114037.3231795-1-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAxMCBTYWx0ZWRfXz+vDlKdkrFpE
 FgvEv6U3LaNWXqVTBHOqRrJE0ZkVy7KxUBc+Wa+NU315pPKppgT+8DemL0ygTiLK9rndB82WOoo
 MHeIvFgp72sYR9V3nsEPqXhtMcZFDGI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAxMCBTYWx0ZWRfX3BbXYRp1HMQO
 qocwuH+N/yw6VtWht3BDiWm4j8f2UThX1Aks/bIxt1noE5EaAoUB6FTYXQSloQFxOosQxet42X/
 zIV0DjngggKHp8eNnFLp295FG+YQbzz/HxQb0Emkn8RKPLFNPz8sbpQma8/CNYKU06o7kHRM9DD
 hCT4xrkQ+nlmF3ehuhm7fkhbbz0P0FyJUX4voZgDadm4DGd29LR74t1k0IRj6gPzYoe2SiP/LuE
 qB3sztTPbpYbkuRLAet7BZpYvecEV5fZswD1EncsQAv/CpjztZkHi0I/M+7ilyKDKxxDi3ew7Gg
 XY445JjH9O1HLKl57moK2CCNvIj6V9AwD2kGIxkN7tuPMdd2vkyShtiPSAOOZMVec8gecI1ibXQ
 ng+trZc5B7WYueCwhK19UYZzeCIoE+EmgicNUejvAT/alvyEF8Ihvn1G5C3uvNhKcwBYkhi4iv2
 x0162u+fI1nmEOc9ldA==
X-Proofpoint-ORIG-GUID: yU3C9bo7Ow9mevYOstL3dGjvdbYQ5d-g
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6aed3d40 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8 a=nvCuiLfjozt6xqLnoboA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: yU3C9bo7Ow9mevYOstL3dGjvdbYQ5d-g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_183649_478123_6A5B38DE 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 9/26/2026 7:40 PM, Jiale Yao wrote:
> ath11k_pull_mgmt_rx_params_tlv() verifies that the firmware-reported frame
> length fits in the WMI event, but does not ensure that it can hold an IEEE
> 802.11 management header. It then sets skb->len to that reported length.
> 
> ath11k_mgmt_rx_event() subsequently reads frame_control and other header
> fields without another length check. A firmware event with a short buf_len
> can therefore cause an out-of-bounds read.
> 
> Reject frames shorter than a three-address IEEE 802.11 header before
> adjusting the skb to expose the frame.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

