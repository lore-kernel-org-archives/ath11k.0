Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0340CA600C
	for <ath11k@archiver.kernel.org>; Thu,  8 Oct 2026 19:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ebm5pPz/0g/tl4YeJ3Jr8z4GlCJlRVCE4c+RayxNGYo=; b=EaO5wk77cYFPIyojyPuiGwgkzU
	OYz6FPMIhVQ+oobvoXpgIS/WvQUcEABVz/siVrkb2edc81qS1V02AQ20lO4NjPkI38UofvLr4EylQ
	JmxJ6UQGGLVmKQfvGR42841TX3ZgSbSrHnO8KkG2J9JcL5sCl0mGXyQLhJIpAcawSwZVzuERsVPZ8
	vV1UZpbmVw9NJvKiegsW8OcJ9kiw75nG51IznbaqSUv4YUNPqq0nO97RPEgYc80hM6yhgzbDnCTHc
	7rpPy3DE/DeX5AvrguWAXGvILlG9ggeO+xmK96ZlSBmr35RWAJvhLV8cJCN+hGmSMI+dxRl1rccW7
	6jP4i1uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEuGU-00000004yvR-0uQK;
	Thu, 08 Oct 2026 19:58:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEuGR-00000004yuT-1etu
	for ath11k@lists.infradead.org;
	Thu, 08 Oct 2026 19:58:53 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698HpB7l2738156
	for <ath11k@lists.infradead.org>; Thu, 8 Oct 2026 19:58:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ebm5pPz/0g/tl4YeJ3Jr8z
	4GlCJlRVCE4c+RayxNGYo=; b=TSh9G+OsXhfm89ob9xVjQRWC/oY/KUteaDdiiL
	nPGfiBycxAbaJSuvQ7GyZ4IeiO1mqqgjlukzObzRDj2EXmEaEXHmfl1kaQO0shHs
	qb+yI/j1GsJxLe0zBc0exsG9Dg0hVgYfkwduqOMHT0cWFYqECMYIWBHytMd85R9B
	6/P2b0xlkjPw54p2Kx6hgRSIywmsPIFaocA4wFlBjzvdIHRLoaebYyHLJQIwSrc2
	lP8HDjYHxLKZQJyoMgoAwH+6AD9svbgk8H8ziHwldNsXXR2x64aHuqCgVyjzcOCn
	E/afPiJPcrVFlxHRhjk+JDNx8IjwcCFzohn2ZjxC83PJH1fQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxk0f80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 08 Oct 2026 19:58:50 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-313d1015161so16172174eec.1
        for <ath11k@lists.infradead.org>; Thu, 08 Oct 2026 12:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791489530; x=1792094330; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ebm5pPz/0g/tl4YeJ3Jr8z4GlCJlRVCE4c+RayxNGYo=;
        b=RftPXkNeoF2Y71XbnyitqBq2GCvzSAQV9hLL9/DnbH5Is6CGEdqcBcQ1X62iw9L6hF
         90+1WECixevNuwOYlvvMuVHH8l89r54olcSbb/xLW2DxunjUnU4erWBa74APYCrGprSY
         6ZGQL8a6RPnodH+WpykNtQB7ZFsWYUP9WgHnBDv5YiPuduDMcXRXgaDdNJtGnBew20x0
         twGgRVz4kL4KFZtZXYw8kqSPAgTJx8nBENgScoAvxWQ4i37uFNt5+be8tzjEBqkEeucy
         FV3SrzKK+66JRqJ8JaquOsR4zm3Lt54QaKwGM6wNP/X1y7nXU4uKPKtcTiGdopIkMaH2
         3zOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791489530; x=1792094330;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ebm5pPz/0g/tl4YeJ3Jr8z4GlCJlRVCE4c+RayxNGYo=;
        b=H1clqasyiNeEUrQHkjzUPdnjwN0oRYYpG3HTuSjTnH9vp7JMQpByO4wtrViOHkzaBs
         IeLNYctL3D2wmNzQGJCToZa7T9BLAuKRPRb1DENkCCl54Gw6ZksU8gQ/VwaH3EER1apy
         2LPaaFk3a/CrYTBkNO/aq+TbIiasW2ufZneMRIn9V/5oGSwHhIWWP+DH9iDZX6c8Iq9D
         nXHBxuZx/pXZcSflhTUJkK+334AABief9ay53zxpPtc58WFCB3H8gXGaG4xuL7fdOeGW
         i+v9QK9uXItPGME2jepzIjOqguZboee/qinah/f98wmZXttR3TxZGb1sBah/EPOX+Lcz
         s4Qg==
X-Forwarded-Encrypted: i=1; AKwUvBwWAiwY/Xw2eUZ99kyYrSFHNW02YWFXQTh8kW8FNhdSE2cho6z4DbzBS4CrnUq+59wj4FD8OKQ=@lists.infradead.org
X-Gm-Message-State: AFq9FYKt4s6ZZ4OKfjPMPGGvQ6MwM6GZXNXJTjd3VW4cXFaj+tl5YxOv
	7pb0E9NgdIgobr2cwniQYdxoVwgmDFss/dfpEhdfd5Yt5k+GU7AT5f/8CgHxhM2hfACtTDhSSNV
	AHmGrJK+LFF2QV96mfBBm4ks2hcX55VJm66F1TWEzHYJE6Xea8NW40ni2BFeBU0TI03marYag
X-Gm-Gg: AYBFou1fpQ7FiQgKIp8DuePu/v3/2CE6TYxAPLCAidsHKkdbgszQV+KO8Z/yDjGXjV0
	/6ToJnDh5Gjx6AOPdRqyHFn6YmYVKu4OESuxTXK4OgsToZp5nFdCGrfCNQhXS5selYDSfz+FD7U
	sxHdIgIJmaHImx5s7r/kyflyPtEvYr4VZkJi5I2hoTmMuEa5a6n6bNIg+LP9BHOZprzp6OF1fHs
	94rgGbLebbuTxe74XwmWXN0yvH52CrXHroVHmFiIUEgtTkrFmTC4CA9acNdew4QTtoczVRXUj0R
	Ds+AM/hwHwErFLFI17ZXqjGw1beNZFnx9TY3H1tJU1VmfmdPVTE5522wZR/OCL3gPg5bTaC60Q+
	IPUWLwb5O/Ba6jbjuCnmR3tDjTutSwi1jFlQ=
X-Received: by 2002:a05:7300:560d:b0:351:165a:baec with SMTP id 5a478bee46e88-3515e0030d5mr7053381eec.37.1791489529869;
        Thu, 08 Oct 2026 12:58:49 -0700 (PDT)
X-Received: by 2002:a05:7300:560d:b0:351:165a:baec with SMTP id 5a478bee46e88-3515e0030d5mr7053339eec.37.1791489529022;
        Thu, 08 Oct 2026 12:58:49 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb6a2afsm231759eec.31.2026.10.08.12.58.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 12:58:47 -0700 (PDT)
Message-ID: <5ca444cd-9d83-4805-88ba-f551576961cc@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 12:58:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20261008
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fKesTpae c=1 sm=1 tr=0 ts=6ac7f5fa cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=WKo8ZlZ-uQDsbn5PVaAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: H0fcbwxDcKW9Dmzp7guVhhBF73cslKXI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA3OSBTYWx0ZWRfXxWTA3qbAnCLm
 4LbFCBsTA1jAoGUg6A4GxgDmZfgtKBMoeqrcd3ocO/gv8OCfx7xC/ktMKtIs5OKORwo3FUB7H0j
 D4pnNjpUtJrzgvoqm9VUfer9j7kKmIc=
X-Proofpoint-ORIG-GUID: H0fcbwxDcKW9Dmzp7guVhhBF73cslKXI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA3OSBTYWx0ZWRfX4rWosEbY0/Ri
 GzU4GLC/C6/DAyjZZ4HgOl8duSj4UO6Pj5Sbh7mQ0Wlq1BjKsthFjiwaPHfxEV7PxGScwOF+rZ/
 ETZdOrj6BQ3Ixt/F7aSncOQeTjRZpcL4RHm6nWF4Ke3j4TeoPoRvznGuO6YEOJRLiCKR+uOBDlt
 OkmpUX6zCdGELTObaIzHqurOtGCaVISqnVIUUzEEAhX/rGYG+xDMVfBG7e6TcdzgZlRVBJUezGA
 ZjBYi8qQFKwwZkQOwbiuINRZmWEPixMfl0Ib+2WVJDHLnDHtD1vYIzQFmdUryCS8K1fFpMoJPGg
 cuGpF0IqGeHOBCXMrBR4z9HBkwrP/ie/dN2+RCtfqEU9DPAr6M2GXx7VyGLYCw5eHe4wsFsQyqj
 2Ov0TPOguTNYZB4o4GMYzozy/ylAGO1VXFBLUx0az8IV+SFEGVSC0X8wkXJJMen5GLSjHWhBECS
 gh877+eMsTkCm6/WkHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_06,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_125851_456924_232F9FAD 
X-CRM114-Status: UNSURE (   9.41  )
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

Hi,
Here's a new pull request for ath10k, ath11k and ath12k firmware.

For ath10k and ath11k there are no changes.

For ath12k there is one board update:
WCN7850 hw2.0: Add support for the Samsung Galaxy Book4 Edge

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------

The following changes since commit 24247053afda2bab6b4ace42402dbf9f3b1305d6:

  Merge branch 'arch14-8' into 'main' (2026-10-07 12:01:52 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20261008

for you to fetch changes up to 575bbe3f83565d18caa73e9b9458f754dd286f48:

  ath12k: WCN7850 hw2.0: update board-2.bin (2026-10-08 12:37:22 -0700)

----------------------------------------------------------------
Jeff Johnson (1):
      ath12k: WCN7850 hw2.0: update board-2.bin

 ath12k/WCN7850/hw2.0/board-2.bin | Bin 2431852 -> 2431968 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

