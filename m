Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1ADCD342C
	for <ath11k@archiver.kernel.org>; Wed,  6 May 2026 18:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3d0biiG3TIvvQzZPN8hzadHrMhW3yVGb7k8u9j8L7pc=; b=4qh4u1Tkl3wscBTOeb4UwvEGKC
	9iYjZZCUClGyZmhTAWSRCV8G4xda5ZDOUb0pPI3GBnF6qL6E2pskHydTiIyRMFqb0dsypERkzsUks
	LpID67eE0jToutJFVQsglrtcGnZITjeFctb2AhIDR7HTRi+31H/VfdkfUfoyIum3XlQzNIDwNNjrr
	ZOa981qOfmiD03/aCNxN8EyiIX1DimedegyzC4QrbfwneMb5AWYZRhIjFRVleShU8YrsfErv/zovc
	w7NuCg4B8JqimgD4PfUEf6p4AVQIkEsmnxwuPOg0geNmEFZnzm5+de7JEc5fbHlbZU+DvcreqIPyN
	ZmpFYbdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKgmh-00000001kNM-0GEs;
	Wed, 06 May 2026 18:15:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKgme-00000001kMp-1uZF
	for ath11k@lists.infradead.org;
	Wed, 06 May 2026 18:15:44 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646EGBEt3309059
	for <ath11k@lists.infradead.org>; Wed, 6 May 2026 18:15:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3d0biiG3TIvvQzZPN8hzadHrMhW3yVGb7k8u9j8L7pc=; b=J+LnISAHcAVjdHYU
	BmSofpg/APNlQpqrY/n09ZNV61mhGzGKDGlc9Rh8MTSuyEWHf8aTRcSifzJPIBIq
	0PtHGR9w8MhUgB1aL7MseuUr315L/ICSRlm0p9Zwk0yNRWiRG/wsEpgSoBtu4vYR
	KCryRgrCgHMJfzHHjkq1WvCA3p+iX6cASoKcXq6SzzpXXSpTdZI9C0hEGiIKFUNf
	xrv7RvN7tvJRx6ZAl5mnUidZiI7xpz2M4z3yx97/EOyS36bVk52mFgHbYSswXdnL
	YYF1e68uWE83bfmhxpynBLlgFDTNWpcLdI5chlz0WSNip6jldIycNWsiCB/JE2T3
	FlI9xw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e078sgxe1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 06 May 2026 18:15:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-365e70c39d0so399433a91.0
        for <ath11k@lists.infradead.org>; Wed, 06 May 2026 11:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778091342; x=1778696142; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3d0biiG3TIvvQzZPN8hzadHrMhW3yVGb7k8u9j8L7pc=;
        b=DiHLaWWbBzXWSFUyW7u8TVaaAHStfcgBUhoQrzh+Hb36Ku8jmP46hWRkSHoPPW78da
         1g+Nq42ZXCBvddZIZ1rrz8VeTSW4+Hb9BW9Tb32T5LQiUDr7OVigpyMLbadDOS8mq7Sc
         /gp7O6ebu1pFEKL4jYx7GayCcV1iCh8iBYicPexIVHVhuFZDMNv6E4ptn+jur7RD4Zds
         mSjr/NT3Nua11E8ODv+HgcbB1vQQ+JjAUnG/PyZNIxv+C8MdXAo1fdeK7xhMNzFnL94l
         2wP/nBjOY8I0dNt2tBAvs5LsA3HSSZ3lZ3YuCxxfJznPR0cph0y/Cx09oTNag2fijIOu
         c7Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778091342; x=1778696142;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3d0biiG3TIvvQzZPN8hzadHrMhW3yVGb7k8u9j8L7pc=;
        b=qNW02C64BYjCBa1laVHPhmLmoXM8lWQ8WUMs12TdgCshKfNk+8eknZCfQXxFDaBZEK
         ft/CAeJWKK9LtHmAydMGFEwj954CB/5PMLSZs5Qw5KzGt/SPp1uZC8KB/sUXGqnmNptk
         7QftEdmiP4FwK8k3Jmkg+gXk0/NtSsX39jtMDroFS/vWyH4YY0N1FiYaenpuDLNzonu7
         Zf+C3jCwk1SRNjXtg9hlztdFmq58m+UzGibc8odfTOMRiCjC3lphnbKeEit0LRyl7gKe
         R3zePK8KFvuyqEFk/obOXcIaendmvuK/JlcMw96Oi5hn8y1IJEpi5tvfgZjdVpPxZKFN
         iKvA==
X-Forwarded-Encrypted: i=1; AFNElJ8HRZ3KavbR6RCCNVuSWlx/jpKRvZC9QQxO9F0/Oi2HZq9y7uoW23UdQfPHKJeI6bkVH2UruK8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwAl56FEOmzXmDS4Yk18xrZzc6IguH8FiFQtLobiB9lfhbwdBPI
	gxFfV58iTQixi+GTtm/7MMeEUav3nECccdK11nR+47Uple9kKc7xVdl0mhYkYLLY/j9DSMIdvwx
	ab0Mtc4gQ2eOGm6Ci+boz7aM/Rp77M2PKFTCloAx+HmqkXQdmsPHqWJHOO+rLWy1Q
X-Gm-Gg: AeBDiev50TouvD4M8WPo8WpvW2MKLo5xus6iE83YZw6yi1YAtqm6aRiP5azWXMRnfyp
	6lkwsIHnLMKepo24Me/kmAF66x+l/DqThe5jF0Re+IWiEU50EPGlQzh4Ss5yz5AUoFeoFO5d8y4
	Or+4e1cGFtzk8aP1iE3oBZK7uzFSbWJTI2gsb5sh9lZcz8lrdSnCuBngeTALvb9V8Ljc0z8AQFa
	DVmVlZvdnKu8Cd3Lhq/on7n651w+Wxv9+KXpzezybMyeh5A6CNPeKDtranaPrV4ylqFlY4oDef/
	/YCiTAIlKtpWapSinXfVaAUjtqye4bYmDnxdFI+hjECUryBtcufWwK/HUFsvtywWN0S1mz4sLoe
	3rnmeqiJ00zY8lo3h09ur1/X6bv0a9K0a5G3NB9rpoux2QQ2beLuf65BHv5q/Lt0c+/TiO4hOBQ
	UfWCgmTNNs8Zo=
X-Received: by 2002:a17:903:2687:b0:2ba:7181:7058 with SMTP id d9443c01a7336-2ba78b3fcf2mr31631925ad.7.1778091342135;
        Wed, 06 May 2026 11:15:42 -0700 (PDT)
X-Received: by 2002:a17:903:2687:b0:2ba:7181:7058 with SMTP id d9443c01a7336-2ba78b3fcf2mr31631685ad.7.1778091341577;
        Wed, 06 May 2026 11:15:41 -0700 (PDT)
Received: from [192.168.11.104] ([124.123.82.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ba7c9e181fsm32986135ad.47.2026.05.06.11.15.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 11:15:41 -0700 (PDT)
Message-ID: <7559c6f7-1957-45d9-b1af-b319e531dda7@oss.qualcomm.com>
Date: Wed, 6 May 2026 23:45:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] wifi: ath11k: fix error path leak in
 ath11k_tm_cmd_wmi_ftm()
To: Nicolas Escande <nico.escande@gmail.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260506134240.2284016-1-nico.escande@gmail.com>
 <20260506134240.2284016-4-nico.escande@gmail.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260506134240.2284016-4-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Lc8MLDfi c=1 sm=1 tr=0 ts=69fb854f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZCREz13nqshT/on6E9YcPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=YLgCGi9CYVZ20EZikPwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE3OSBTYWx0ZWRfX0Ll9ek9t0ljB
 e0gMHH8Lit7QIjZGAh23cKcV7BUzuDcmMyNiXxJ1sWBtg8qMJdC0lmUoeJlxg1SYcLh33Vc6MrH
 /YnF6pbJ71fwgXQmsFsoJ5GrrvA201wU9oqYwhlIBWqSIq+BE5CwovgYuY+PFJAXKYTdrbgDQAm
 uBWkdkhlMNU99v9CGpeq5sMHCZQaiWj4IdRymF5FJYkkjNoI6JRn+0GQWgI54Adt5LFeCHs0cEM
 lZ14HIw9Grn4jQRp1IQZyjaxWRqz6H7M4CdI/1uAcxLzESqyfZCPnTVqHmWdhWAXoVo/xuRMW/i
 AxnTjJ2Wk8EQ2E5VdRc0mIiCFOQsEl0MWcM5IdcakbM2sQY9UvD8kQOX4LjVigLoXzHCwSzEMHK
 Cpnha9UOkhTjjPRBMKzeV48gkUXvsyXDFJuMHl7naaJHEpy+bUgXNVX0lALHj8h8pW0mro7PZo8
 ZhSPE24f1XEqfwzUDlg==
X-Proofpoint-ORIG-GUID: h_Uac0_34VfAHUn0XafBZJnDOKrfaFFH
X-Proofpoint-GUID: h_Uac0_34VfAHUn0XafBZJnDOKrfaFFH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_111544_540930_CBEA32FB 
X-CRM114-Status: GOOD (  16.18  )
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

On 5/6/2026 7:12 PM, Nicolas Escande wrote:
> This is similar to what was fixed by previous patches. We have a to

s/We have a to ../We have a call to .. ?

But no need to resend for this, I think Jeff can fix in pending ?

> ath11k_wmi_cmd_send() which does check the return value, but forgot to
> free the related skb.
> 
> Fixes: b43310e44edc ("wifi: ath11k: factory test mode support")
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
> ---
>   drivers/net/wireless/ath/ath11k/testmode.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/testmode.c b/drivers/net/wireless/ath/ath11k/testmode.c
> index a9751ea2a0b7..c72eed358f6d 100644
> --- a/drivers/net/wireless/ath/ath11k/testmode.c
> +++ b/drivers/net/wireless/ath/ath11k/testmode.c
> @@ -457,6 +457,7 @@ static int ath11k_tm_cmd_wmi_ftm(struct ath11k *ar, struct nlattr *tb[])
>   		ret = ath11k_wmi_cmd_send(wmi, skb, cmd_id);
>   		if (ret) {
>   			ath11k_warn(ar->ab, "failed to send wmi ftm command: %d\n", ret);
> +			dev_kfree_skb(skb);
>   			goto out;
>   		}
>   


--
Ramesh

