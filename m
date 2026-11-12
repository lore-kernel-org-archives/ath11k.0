Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A371A606A887
	for <ath11k@archiver.kernel.org>; Thu, 12 Nov 2026 18:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lTxNn7Kz;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kR7gqGW3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XpOXUyOD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jL9mLT9/8QhZftfse5bf4rl2t7BkuQXGO4xCAK/9gHs=; b=lTxNn7KzGW+3FP
	JCe9xpCa+AWUFmI9gWqVONT52MIQ3OYuQKT0KhOSkdquGUAYIiip8hVCPJU3M+tvrz+kZCXr28F+i
	vpEBn/P+uD5OdZVMY6dAjbijn2RRHj8QdpF2oHAIBMQtsTrLQbP83lTETVVWkc0ucK0xg9+ByelNk
	vbnpehRo2LHAjYqabUNsECiMKHZUOHAf7KjGcfiEpeeOAoNrsPN6rURUh+iP+WDP9FbeNs9/1gvuU
	f95E/4vCLGkDpMI9WdDef+auC0kP5MBulSZdthHLD27UfTqSqBF6cs61BcnXTghDvT1DnpCdZCoVJ
	YPm/YZCTRRlACq+IHvxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRZjF-0000000Asnc-15pG;
	Thu, 12 Nov 2026 18:40:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRZjD-0000000Asmr-0Qw1
	for ath11k@lists.infradead.org;
	Thu, 12 Nov 2026 18:40:56 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFZVrF1159593
	for <ath11k@lists.infradead.org>; Thu, 12 Nov 2026 18:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jL9mLT9/8QhZftfse5bf4rl2t7BkuQXGO4xCAK/9gHs=; b=kR7gqGW3gNo7/jGp
	m3FfjZYNdIisd5P4znahl7/XdlXgZW+srglDsTB+gm0Gseg2b6dNAsaBGbM2oGia
	4MqYVTyZLr9TcgssRiB2kDm0VSnvP7KZDtoy5ZlpUiyNHAPWsCWfaNXFxrHxZDan
	AfB46TveDYJvsVoGoTxAmBr0bFO+EQwWrVlc++hquqNyQ3nHAffIu1mVPZIe0oDP
	1mqZJN4h1Cs1M8kzefWXapkhzfC0wENHxMy0GMpRPl0rusbR+3DYgcOZYGPFadUp
	+tS3iHoHmCXzpiW0HLkDdQ5KN6rOXA8YHjBEPHER8/5xGuv2cR0FdiYfQSPSM8mN
	ydddfw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9a0aejb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 12 Nov 2026 18:40:54 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3b5b49cabso32928c88.0
        for <ath11k@lists.infradead.org>; Thu, 12 Nov 2026 10:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794508853; x=1795113653; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jL9mLT9/8QhZftfse5bf4rl2t7BkuQXGO4xCAK/9gHs=;
        b=XpOXUyODHfbNLoJm5vfLZY4kJYq+GL+n8LIoPQJbepgLlgQGX2qcA9Z3S8EIW0h/bU
         DHMrw5+EsU9hFo4PaADK2av6xvRhsYYjBb0RNOKhbYgZF7vAUVPFtrWospyf94ad/4I7
         ceVVmXkiHuUlp2r1rQR5sTNnfq9jq9vcufAVAMGH/U0C8qLWDY68JHVkFfzCjkk7tCzv
         d+Ja9OqPyv9DdTU/B+2hbuY5ReJmm0YoV15Ia7P6nwdM6epZWa00UKqJxapE6nvmQmOF
         uj+VRLKTh8E9Tegg1vuU5cRyJiHdaq0QRvSS9zxt5kj7jpAeJCmQEQgYRJXI7CM0Kscj
         uz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794508853; x=1795113653;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jL9mLT9/8QhZftfse5bf4rl2t7BkuQXGO4xCAK/9gHs=;
        b=eshILwHstIgmFcVBJqHYfo9q1yWSrxK98IsD1nn/k5OjEhz0SK9OruJxDGiWDo5J3G
         VdkxT63Jfy9DSM/tKh8AKHljmb9cU8wwZcWP5JRzfXXRll4rT0QSW0fkeEwdDdUyVmsw
         kMdMy61v0xi7DiYLmH516pCDGa0z+rKy2iN/SCCMjoVoIhKTS7JuxLGuxoN57zG2xbo1
         YLrm1HyJXrX9XuXlN6ZbBThNGOSj3/V/XpFwBrccokdpoF39wfa7F2lRFH5pcRll2MXa
         70m0I8F6hGAUoU9MKN0GJ9E8IN4tRYLPDGFg53K38tt2UDrfgk3V9o9Z96huGbQryYBK
         OaYQ==
X-Forwarded-Encrypted: i=1; AL+hErG6Jd+/OAiGRz6ilaiuj6rd7kbWIX263jEfCSRFx316CkuG6/lzH2SR3fhVqH2FX1fUw1dLGmo=@lists.infradead.org
X-Gm-Message-State: APuU4Z9jH3bEXaf4JCIZBaWEBKYvpiRPMz/+xwlxS5JvoXHunqDwgRCW
	Ejk2bA1ydOs6EbnlXp05V++aKZAVhbG3whnPvoDjYuJHlEwRXop7UTsxw89WMbO4G402Leuh3rs
	bGBjK4IkK2q63Aas8EA166bOdrFAxYvGplmP3gRTO1y2qNjDBMc5p0fWx5uC1IEdC
X-Gm-Gg: AYBFou1tLRAS4HrgNOF71l1tgKzYet2CMTz7rbgEE0pEwpM/IzWiakDin+GYx3gSkYc
	vuSkKovtNnkLzoHjjXdfwnLtBR2EOdWZ8BR1BXRDWynK+Ialc9hDDXc4cD/3yCWKX7T4XML4ssd
	HiVPQZNLvVJb/L1h3PD+W0GQXFdPJp5U6fEDdv+DmYssipTIeM8/j2sVzAsD0wwbCj47ZBdflRQ
	Ribzglvcirhsl8cdJTHXi3LOPgVdW7RSKcLsdraibHqXZaX/iZv2PaUGR5r04ZTKcDq4igqYbEg
	rHEZoaemg9LknXnW4D3TAfrH7j4jynLYWRWTgEixD4UC/iVYDdOqix9eReaauMJ902vOPIEAqyX
	g4hV4yN0RdbpJWINDb/47j/pEYJKxUd2xDv7YFbSDWvdYEz8gAqYf8ie8HLBDp5+79MHJa2Zr0M
	0JsCLysiLXZztxbMbYB6DixXjgv8j6
X-Received: by 2002:a05:701b:21d3:20b0:1b2:43b3:a90c with SMTP id a92af1059eb24-1b5030d845emr301361c88.9.1794508852773;
        Thu, 12 Nov 2026 10:40:52 -0800 (PST)
X-Received: by 2002:a05:701b:21d3:20b0:1b2:43b3:a90c with SMTP id a92af1059eb24-1b5030d845emr301323c88.9.1794508852098;
        Thu, 12 Nov 2026 10:40:52 -0800 (PST)
Received: from [192.168.1.20] (39.sub-97-215-59.myvzw.com. [97.215.59.39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031918c7sm1204910c88.9.2026.11.12.10.40.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 10:40:51 -0800 (PST)
Message-ID: <002f7e3f-e4e5-4c7b-b683-c2add5b6377c@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:40:50 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath11k/ath12k: drop TKIP frames too
 short for the Michael MIC
To: Julius Bairaktaris <julius@bairaktaris.de>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Manikanta Pubbisetty <manikanta.pubbisetty@oss.qualcomm.com>,
        Kalle Valo <kvalo@kernel.org>,
        Sriram R <sriram.ramachandran@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261111080620.244164-1-julius@bairaktaris.de>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261111080620.244164-1-julius@bairaktaris.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6DFwGjsiQmbUs3zU_vgrx3nzum0seos9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA3NCBTYWx0ZWRfX6lZD9dWVVzso
 kJ8pGq7cFlFgjTvb4jLnk768VqC/E53YyNSXA0TbYApycRLkvbHGsPfxZFXgiH98+eqsz29CqOj
 3s2L/b+czmRdflaRwM8kESxXzT5U4+/K9DeCvTgpGw3Q+/ReihfjgK0FrCkL9WM7N5JCf4bj1af
 xd40AZPXV8U8wvBLrGOoJQtVJSGk6xD0bP49GqomXE3OLF+FYZTQUWH+r6DOhU9tfVnstfO2EVv
 PZdNt6xh71eisSbAk+2m745hfyz6ddQmK8N67qODgTgiQz+I8QD9yVUBuRgM7rvIvsQ/sJcvVyS
 K5xXs7c5lB849tELK6Qx8ZFdzrjsGNAOp1zi9QuynDzNp0qeSiL9GA4cClJnVYe3rD6xOICr+ka
 o6sEDJFEJYqxIwJT6axeT1Hp25PebaYFhOa8+QULMxu+BlEaTjY7rZ6sodp+IMNOy3tR7wORhjN
 m+WvVgVfmuD1vrrRANg==
X-Proofpoint-ORIG-GUID: 6DFwGjsiQmbUs3zU_vgrx3nzum0seos9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA3NCBTYWx0ZWRfXxkVtpqQ9UlIN
 0wHnZQl72NLAVxo5CN6Fby+ByAFuUtYsQrc0VOkJPHMXZAhPwPbh05IzQfceXpOR2h3JyoCJWo0
 qQPyZFqMFBdcQhzqXME750GVcIl9OTg=
X-Authority-Analysis: v=2.4 cv=COG/zhrD c=1 sm=1 tr=0 ts=6af60836 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=7UwXyAtrHAWG9Tdc5CO1EQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=ZjrBiyIVtDbkfVDLAEoA:9 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_104055_299023_DBD75A9E 
X-CRM114-Status: GOOD (  15.78  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/11/2026 12:06 AM, Julius Bairaktaris wrote:
> ath11k and ath12k check the Michael MIC of a reassembled TKIP frame in
> the driver. Both compute the length of the MIC-protected data in a
> size_t without checking that the frame is long enough, so a peer that
> holds the TKIP key and sends two fragments with fewer than 16 payload
> bytes between them wraps the length, and michael_mic() reads on from the
> skb data until it faults. Each patch drops such a frame before the
> subtraction, as mac80211 does in its own MIC check.
> 
> I used Claude (Anthropic) to help write these patches.
> 
> Julius Bairaktaris (2):
>   wifi: ath12k: drop TKIP frames too short for the Michael MIC
>   wifi: ath11k: drop TKIP frames too short for the Michael MIC
> 
>  drivers/net/wireless/ath/ath11k/dp_rx.c       | 5 +++++
>  drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 5 +++++
>  2 files changed, 10 insertions(+)
> 
> 
> base-commit: d0fbb39d65dc9dcb4175fa6b23e473dec3670f4d

Is this a theoretical change or are you able to have firmware pass too short
frames to the host?

Maintainers are being overwhelmed with "fixes" that are theoretical and which
do not occur with known versions of firmware.

I (and the stable team) need to spend our time on exploitable bugs, not theory.

/jeff

