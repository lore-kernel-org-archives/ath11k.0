Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97B2C55172
	for <ath11k@archiver.kernel.org>; Fri, 31 Jul 2026 21:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TfF+pTYN4bzorxHULetkdmAKLRCNK78Wfl5RM7zPhDE=; b=TV5fpcDYtHQ9XcmlGSpnM+/qy9
	LZoSgpNxQcLUtgix6C7xJYfaY3v4NIpPGmJYcwEGrd/0ZwJx5oF8KSQRw30DzG8+28O8TlWcT61rx
	zO1D5VJ+CEiZ6DVeKFipWnTULJMw6uyW+Rb7oeOaLadqZU0gR7p4lprh3iGjmRB/4Qb8fAfQacMdm
	u4IT5tuwC4douDnrGXnycwXbSiarWG5co3O4TxVwWcBKwq/timN8C8u06KviGbg1+FL5s430jv3JQ
	B5DGTaqyNcrGjKWoiP+c9A2Q8iKU/k37N3shv8IjCnxZZoYNyLN+q7A4mhsDp9nFaci8bpA00eUsg
	w87QRZZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpuyC-0000000Dd0J-0iZ2;
	Fri, 31 Jul 2026 21:40:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpuy9-0000000Dczi-0Aoo
	for ath11k@lists.infradead.org;
	Fri, 31 Jul 2026 21:40:42 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VKMNE42069868
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 21:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TfF+pTYN4bzorxHULetkdmAKLRCNK78Wfl5RM7zPhDE=; b=O2Hgka2/DcvXYP0n
	TSi7DyP8IpzrQUFXfM19bqtEuhyZml6nY85pJ962DyOL3SfwFSouVR1bNjxgq4dX
	FNi6K+hbjcN8mauUKjJxA+EImpnLYFKuQNQH4WYkc+GQK1vcGH7Pa2gHFxAy3dWK
	QIkv565zqAwxxJ4MAxsgwcrnsgg88I0s/1tymdDvKNseir/0kkPW7DmMXIIoeakn
	jrs/lf+26Nz2ng8gxk7o91enaEqBI46I9pajN52FgbxqN08wzQ3jmFskrzKFxObQ
	1VPBUuEQxVytg7jQOauCpy7e6qUBRf1IH9FnnW+nq0OScd6iTUO2if25umoz4ijC
	zSDyeA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru1xaj5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 21:40:40 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84e375d9736so2136428b3a.2
        for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 14:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785534040; x=1786138840; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TfF+pTYN4bzorxHULetkdmAKLRCNK78Wfl5RM7zPhDE=;
        b=RE4XvgPlXyMCUg1EjLhhvigm2KrQuiSry0KGBGmhM+gOJbUGxT3CQg1xmGWKu6XkWs
         9etQhe25v4egDyNW0NtavA0n4UrQF9hkAAv7ykkLUyTShKalkPbcBPrf5zUpgBotwKBH
         E2Xi/GWK5+27NdienhCxgl3ADNQahK7GQc0hUBIw0tMPZQ+BwS0m2Vel26klJGU4tZqQ
         QRrv5amTnIusD8HJaCjsfUTOsf0tKTlNnxo/VLgP/vM6Y6YaMlGYx1/3w+P3L4YMEHDQ
         rV2cLDGblDZ1hJlXExySNiF1vhFhdPXh6w+zDMmjmNBMEk0Lgi9QM7RXKDpJ0HBi6Oa0
         CupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785534040; x=1786138840;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TfF+pTYN4bzorxHULetkdmAKLRCNK78Wfl5RM7zPhDE=;
        b=PaY7EX4u+7FyhdpWnjle1Lni7DPrHnzKSYXPK9YfRr5zTJlkD7ZFM87EFMg+z50MXv
         2lZakj3G8K3K0iHqoVJGT0IhqiSpHEPCVCWxWxzbPLW+sAEkkj6UyP6rDuIs9t+LQGG6
         WopDeyytn8sWR6832JdmWHX4OEhzJY6TopoJiB1wtBRgyqW7WPmIBX7S3a8g9UudLvNh
         2LD/1F1HIxsCl7GSimSzYt8lRQIo9oy1e5FjRJIuFA+2Pp0sX0oaYv82MdGPs55xU/4g
         8W8ibQbjyJFj8oM/sHcw2JP0Vid355zqtY+dgRnyDzC89y5Lezqqj3KcnNFruh7AzmwE
         +HoA==
X-Forwarded-Encrypted: i=1; AHgh+Rr1N1ZdQRPoaJuIWTTYZgo0XakpqIzR+AGyBvfrCnSrvJZLOYZZWOsOIq2FAkqWojjWV9qV3i4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3BkaDZwuqHfdfoqLpbwc1+JuS9anbC9oY489F7/NiXQB/JWfy
	dRpZ3KDbVRtYDirPIaXGWmS096iTKcsV4wRbCCIb6SFlCYg25dZzlKRTc7ggUMdKQY+l7/EKVah
	4pXtHoViEkY+u3+NHkvcVjCmgipy10e2YlsgnwNY9nyayb6lBWacN/A4WNull5eIy
X-Gm-Gg: AR+sD11dgjLnCFX1xbuqV3QXvY7rZn3dXlUnOhcT/hOkn5mVIDZFKAdsYZfRCLvGVf7
	lj4xY3kOZrbnm6Pr648+Y8FAZ4SUAf9Aqwn/33/dVQmQZ+UX6jiXdJbSX6HR+9MLmTZGS2+UK5t
	CUvTIxbs8D7tceGe0dx5oZjfFB4A5JrsNS+Z/rMW0kEu7vWA5JJeWWthT0nBQ7uWt1JW/WG9Np4
	JqVjDXmZQCHnDhybbs1f3pPTSgo5/DUVznyAUTPIT0ohTYSG23lcLvkx2bJzScFKLIhHaI5n4vR
	jw5PvxEk46hMjI7dkzSGPWxs3eCYDpjJw4fHC9yiNBuQc3rkzymVMROxgLeLJ8MWM/rBKkXN5OU
	o9oMiJQ4fmzR7KB62edyaCcSm+CzVaJDvNsJbLUDBbdHE+9U82TGEN0FCR9M=
X-Received: by 2002:a05:6a21:7489:b0:3c3:7019:64ad with SMTP id adf61e73a8af0-3c92a8be664mr1143646637.66.1785534039855;
        Fri, 31 Jul 2026 14:40:39 -0700 (PDT)
X-Received: by 2002:a05:6a21:7489:b0:3c3:7019:64ad with SMTP id adf61e73a8af0-3c92a8be664mr1143630637.66.1785534039429;
        Fri, 31 Jul 2026 14:40:39 -0700 (PDT)
Received: from [192.168.1.9] (103.sub-97-215-187.myvzw.com. [97.215.187.103])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e47dsm13643035eec.3.2026.07.31.14.40.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 14:40:38 -0700 (PDT)
Message-ID: <041f72ea-7dfc-4d50-ac0d-e0556f037a27@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 14:40:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: Fix possible memory leak in
 ath11k_dp_srng_setup()
To: Abdun Nihaal <nihaal@cse.iitm.ac.in>, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260727105532.118164-1-nihaal@cse.iitm.ac.in>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20260727105532.118164-1-nihaal@cse.iitm.ac.in>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDE2NCBTYWx0ZWRfX3KTRw5gika0d
 nBwkjbNCmJzjar8AGkt1apLbF8ZAg4cS3W/vBDmZF73ZSi6FS5AP1Mi/GPlarjYO/ePtQ5fYiMS
 1yNbNmtO6yhVuYWoj7eBFkDB1TvweZ8=
X-Authority-Analysis: v=2.4 cv=GpByPE1C c=1 sm=1 tr=0 ts=6a6d1658 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=UaEkX0D7FlC0tWE/LoNF7Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=FZ0-UiQHMHqYDEnaofEA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDE2NCBTYWx0ZWRfX0qoAOOlsKg+I
 NYC6JffLiJsMU49NcF4pBPdFDcxxW2VC5RkjcMs5QunhtJAm5aWdJOxkGet8W3kQ4m/I60e1aOK
 4X/ABAoSHfpbY1+MLPOMFiGQdS7hZAHr6nTILxZgXKzJgxjeJ/oZhM7Nn4JEJi4AEc1Ps3aYFzk
 4v0NBi09Zk6BX3oUx1cNpBa7PnDanJjIa29CAdiaqW6LpAmioZHoB4lb/Os+1nN+3Z5nzXHLXrm
 6NPd+PehTjonrtFACfO/ABFg2EaSI5LwWBxLy9JhLzmNIP8pzAW3Ha5+UwognzcuWTCa7qZwF4f
 XK+LWfZEYHxpgblxE4NJ8A+nPLY31BgBJcraaDFJSxNSZkQ0hv4/nZI1CCKBGpZUEJchcV1gDgX
 cHm7zHZ/m+9F48q+dkzYpNX+fTCZCxuBob0rTgSt481OTUTOcIHb0KUH3wpbBVedSBFKboqaDbs
 IPAQNpc+yRaOniLCn0w==
X-Proofpoint-ORIG-GUID: 0Vq0otPbNqonK_-so5nA7FZRfmbSMuGK
X-Proofpoint-GUID: 0Vq0otPbNqonK_-so5nA7FZRfmbSMuGK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_144041_121869_52F91AD7 
X-CRM114-Status: GOOD (  15.94  )
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

On 7/27/2026 3:55 AM, Abdun Nihaal wrote:
> In ath11k_dp_srng_setup(), the memory allocated for
> ring->vaddr_unaligned is not freed when ath11k_hal_srng_setup() fails.
> Fix that by calling ath11k_dp_srng_cleanup() in that error path.

Did you find this on your own? Just want to make sure you are aware of:
https://docs.kernel.org/process/coding-assistants.html

FWIW my coding agent says this patch is correct but incomplete. There is a 2nd
leak, at the switch (type) default: case which returns -EINVAL without cleanup.

Care to incorporate a fix for that in a v2?
For that part you can add Assisted-by: Claude:claude-sonnet-4-6

/jeff
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Cc: stable@vger.kernel.org
> Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
> ---
> Compile tested only. Issue found using static analysis.
> 
>  drivers/net/wireless/ath/ath11k/dp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
> index f389b97acbdd..c3a16da1cba7 100644
> --- a/drivers/net/wireless/ath/ath11k/dp.c
> +++ b/drivers/net/wireless/ath/ath11k/dp.c
> @@ -324,6 +324,7 @@ int ath11k_dp_srng_setup(struct ath11k_base *ab, struct dp_srng *ring,
>  
>  	ret = ath11k_hal_srng_setup(ab, type, ring_num, mac_id, &params);
>  	if (ret < 0) {
> +		ath11k_dp_srng_cleanup(ab, ring);
>  		ath11k_warn(ab, "failed to setup srng: %d ring_id %d\n",
>  			    ret, ring_num);
>  		return ret;


