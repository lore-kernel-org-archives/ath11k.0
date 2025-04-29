Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120A0C3ABA5
	for <ath11k@archiver.kernel.org>; Tue, 29 Apr 2025 05:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eHju9dv8AbgTtrh4Rh+8EaZhuXoJuvizsQH/ia8kfRM=; b=t63Jkn5Fm548azjZk1U416xNbs
	Pn+G4eoVntPuXCOksaEoZPtJAWniPzBR3blXwik0zzPIOxaIvZbsylg/Cr0J7mwNfPpSiHM9gylvl
	BX5QPRHVXi9wnmGoaIdoFhAsHX0B7Lfeg9UE+Bsh2HnK3mYYUAVuyhrX4flHN+KORTFQG3/B+cqPw
	4HtpCKMaoxxQ4vnwu81MlMOguBZylZl08Q8wysc2gbrUsl5fBGm+rBMmeXYC2sTQlyMkq7MryYeos
	p3umx1QCUECadd7Vdk5BUql6ozomnkFLtQA0Zx9RU0CUWGJNscG4fSm5sZsUq/GsZTMaQ95N8Kx32
	zWGbbJPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9dQl-00000008NE0-220J;
	Tue, 29 Apr 2025 05:22:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9dQi-00000008NDL-3W1m
	for ath11k@lists.infradead.org;
	Tue, 29 Apr 2025 05:22:54 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNrjit022955
	for <ath11k@lists.infradead.org>; Tue, 29 Apr 2025 05:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eHju9dv8AbgTtrh4Rh+8EaZhuXoJuvizsQH/ia8kfRM=; b=pHErKgJmHB21NXPV
	clUfGkZxB1TfUyv2XyImOoorta3DgPmcVWy+HXiiRBAGiiKAhyOcK5BKECjL1a3s
	pCkJrGXOugBITbxM9Xuu3oZpxL/dgZ1WPIar86MIN7i5XnPC4jR5uH64CP62Jmf7
	sEGYqDk4+wGtSBF+ZBu/T6hh34XFMgAmMO6HOTsyYYiiZmkblRohrux9JaB86L4O
	8hB2yNBEdDcXEIrCdu5EHuH6yfMdVnGAq10PLIg602vOBsMqLUk65E2NHUW01muO
	d0p9dD+y2d3lT4LGqiX6I9/BfOQBtxr0PI1KsxFJdopDVbMEGBJtp3eXhxhwEtd9
	1KL/fA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468n6jjman-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 29 Apr 2025 05:22:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2254e0b4b85so53587685ad.0
        for <ath11k@lists.infradead.org>; Mon, 28 Apr 2025 22:22:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745904171; x=1746508971;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eHju9dv8AbgTtrh4Rh+8EaZhuXoJuvizsQH/ia8kfRM=;
        b=otc9erdpovFoy+xVqIhClBw87OOD48+/CIl+R9Jk1KOZqRwsR0ub1/osN/0fMg17RF
         e+ZSTnXNBkuWNQ//Aq0gZsCWgUqDWP71cR/GG3/eWhj93DKIn8DGIAbAXhXD6y945Q0W
         7UI9AKZRFdCPzveFl0LPDYhKn2yn+YGh9IpJJajZMb0OqNm8f7zt2aIL37F//HhxkwGu
         6awb4MDG7nckDoxsOjoL8UHulhHp9g59iP0+DDbnZDPNlOt6DBCWhmbxvMY2oyW5hAz5
         X5McJCf36JitBicSNVUSwRGxfQMwK+PZtT/ZJKXJqzufWnFcZW35nuU4BF2zWAEa6Iwr
         R35w==
X-Forwarded-Encrypted: i=1; AJvYcCU+a88HaQpBGu5YXrSfeO386Uxoyw4At6UsWemRHhv54KGwXeskyJEjrL5zJnfhKNiISrUWfS8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwIntNhPks37mQw6ZlzgMgZT86mTw/CyX/qv7EM3kELBUehuQS3
	IeOWBkC+IxGfs9Thkrqxrs64RHEw1rsi9NVmL8pCPk0KmZ1cXTCPG/UzQy6Qba94SUR3/fMgC2G
	7NY5TqKWmIvU9L8Z0c+kzgYPjHa/f7VeJPGNd4qE/PpCPX+fv7UmyzL80/wqH
X-Gm-Gg: ASbGncvCk8GONkr/tPIYyUarTgouhzHn+ci33u4Sk2v3EdJwAvNpCqU7sanyOfV2ocr
	3sz3Vxu5Rxeh4VN8GUki5CPQwT/JrhCAXSG5F2kVgiHCZBxDSwnYsRPtvp9XZBb3iYDK9lx8P7F
	v/CSV/NHmzLg3LwBKxXQ8IfUdCJn2VI7E3iKCvSzStTEztzki47s8vjCUzgAxypU47CCP1TSTUu
	+3upSu7ld79Qj4Q4O01PMPVsw1fJau4ZsU/5L7FZsSWZbWXQqy8fYCY/e7hcvdu/MGY9kjA9GXF
	GpEgq7zY1dNW8jWAZw4yeRTdJQDDOUduwWoFDuQbTsNqc8TuKsb0yQ==
X-Received: by 2002:a17:903:41c4:b0:226:3392:3704 with SMTP id d9443c01a7336-22de6c0b9edmr26765135ad.12.1745904171323;
        Mon, 28 Apr 2025 22:22:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHW6OJEOxRPg1AT+XZjBVv4nDaNye4gjeRQF7wwUXAtlbEMTRNBoGWaUB1qClLHflV5hB5V2Q==
X-Received: by 2002:a17:903:41c4:b0:226:3392:3704 with SMTP id d9443c01a7336-22de6c0b9edmr26764925ad.12.1745904171003;
        Mon, 28 Apr 2025 22:22:51 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7a28sm93665405ad.110.2025.04.28.22.22.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 22:22:50 -0700 (PDT)
Message-ID: <3dc71c4e-1061-da32-9974-b0ec004ab328@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 10:52:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v5 3/3] wifi: ath12k: pass link_conf for tx_arvif
 retrieval
Content-Language: en-US
To: Aloka Dixit <aloka.dixit@oss.qualcomm.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, ath11k@lists.infradead.org
References: <20250408184501.3715887-1-aloka.dixit@oss.qualcomm.com>
 <20250408184501.3715887-4-aloka.dixit@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250408184501.3715887-4-aloka.dixit@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDAzOSBTYWx0ZWRfX+U7HTXasrNNE W0mH5MLZ3Ahx4O8lPEU8HlhXqrQ6EYur+i00K6wSFR25N7AHDmEfmImsqnz5aA75u70p2nZpgwP 23/10bUB2Gtx5gCIoPSFlYTf8PuK7dj+UXODSgIDHwE8ITIqTDw1Ywp/8Qd4HCToaTvJpU0WFY2
 neMyRLnwLIGe2J5JnoKoRd2MZj9rXhfmf6nyLwdxhrHov/CxR+Uo2TT3+30yeKetSWowYhhq0Rk VCiG2vhW42YVgy/G9aPiT0afSu5rYEMpYJv6/UEHyDsSLMxNSe0yZzcbC/jWombPSJcjLcKdtz0 7ccWnQYK9+LtMbGZSvYc7OreX0q9caek1wLzqAqA8x0Akk1xiE9vo1qRVYbhwrOAfuH9Jjgt54E
 481nWKqlQVVzo2MQQDekfp2zdntVlJ1l7ihtirWWUg6suqIfE+FrI9Mpvw2931ORea9IvVM1
X-Proofpoint-GUID: FXiBsAbdmxga0yBBBZwu-XOKyHCqNYCM
X-Proofpoint-ORIG-GUID: FXiBsAbdmxga0yBBBZwu-XOKyHCqNYCM
X-Authority-Analysis: v=2.4 cv=C8fpyRP+ c=1 sm=1 tr=0 ts=6810622c cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=N-p2Yt28-VMXFBeuicUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxlogscore=719 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_222252_890124_F8DD7341 
X-CRM114-Status: UNSURE (   7.47  )
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



On 4/9/2025 12:15 AM, Aloka Dixit wrote:
> Three out of four callers to ath12k_mac_get_tx_arvif() have
> link_conf pointer already set for other operations. Pass it
> as a parameter. Modify ath12k_control_beaconing() to set
> link_conf first.
> 
> Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

