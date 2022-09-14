Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA491ECAAD3
	for <ath11k@archiver.kernel.org>; Wed, 14 Sep 2022 03:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:CC:To:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eJQIPmCk+gH3M89hr+5yz2ioar0HHESf7RrswT70v/Q=; b=ESldHVsXxhkCo4/+bUI6yvOwPB
	c67oAPRKbSW9vOAHdqrBGBXQl29NaXYwB9su7DI4DVRrGVElrwudJ5vOEHzHMIhyP8/3vDX++PYtr
	1tsFbvt9VRt79/8845CeyLNTLQD37HWVoySXFSrlyT7/XXQy4ENBb9F4xABD5hduEzendBC1i9ikX
	g0dW8YEcpN2Nas/T2pipEIg7TT+pb0PxaJn6PYJk70GxZn0Q+JEWIJPAQPt0jj/mm/UuczqNE0slG
	MFhQ/B3h1Up6m2jjA8MCIk9yxBpZUR27LLumZO0jVZlXEHci2nsS4YvIioysY7l7aX723Spg0MGWN
	nm78eNWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYJKX-005nR4-1Z; Wed, 14 Sep 2022 03:44:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYJKT-005nFr-SB
	for ath11k@lists.infradead.org; Wed, 14 Sep 2022 03:44:51 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28E2WXm4022024;
	Wed, 14 Sep 2022 03:44:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : to : cc : from : subject : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=o6RB6A0kpfsIefD+sTPm1sGlkCN0lI6Kz9AXWfCogaA=;
 b=gnl+YFTJs5T4WKlfS5jdg8oka67Khas/WzzgZCZDtAgOMRJ8RUNjsVK9FuodFQScddKI
 wXDe6jDVVYV9NkiOaVkxz28vlvx1Z8D7x6fPsqGsekxaja8TU8qhoTgsNLOMqJJ0HVVw
 Mz+9G4fqhaGlWvgVEfaOVo/RRDtnCdu4WH5V28cNYaChMuE9JHA/ayyhJctQ5NaF9ph1
 /Hy4eVBO0cfoK7MPnylTlNcVm1qK1lEU5/4Uccrd3yIURNnn14lg/z7Vu6laqGV5jwet
 TE6CWwt5s1QEfBwfxE5esAI3tsv/JAeiLjmGTLir9f+f4aSxICpl1dzKqop0DuM1Bw9Z XA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jjxys14t4-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Sep 2022 03:44:46 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28E3DTZF009823
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Sep 2022 03:13:29 GMT
Received: from [10.253.15.55] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 13 Sep
 2022 20:13:28 -0700
Message-ID: <e1c5fbac-7e6e-c643-f24d-32cec779f2d3@quicinc.com>
Date: Wed, 14 Sep 2022 11:13:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        linux-wireless
	<linux-wireless@vger.kernel.org>
CC: <ath11k@lists.infradead.org>
From: Wen Gong <quic_wgong@quicinc.com>
Subject: unicast probe response bssid changed by "wifi: mac80211: do link->MLD
 address translation on RX"
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5fHklR2gwj1hwg5rSl67vcDrkX9hr4yp
X-Proofpoint-GUID: 5fHklR2gwj1hwg5rSl67vcDrkX9hr4yp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_12,2022-09-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 adultscore=0 mlxlogscore=603 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2208220000 definitions=main-2209140016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_204449_993314_8D8A0560 
X-CRM114-Status: UNSURE (   8.55  )
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

Hi Johannes,

The mac addr of unicast rx packet all changed to the MLD address by 
below patch.
Now the probe presponse which is unicast packet is also changed mac 
address here.
I found bssid which is the MLD address of my test AP in cfg80211_get_bss().
For example, if the AP has 2 mlo links, link 1 is 5 GHz band, link 2 is 
2.4 GHz band,
then the 2 probe reponse will be changed to a same one.
seems we should skip probe presponse for the mac address change here, right?

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=42fb9148c078004d07b4c39bd7b1086b6165780c
wifi: mac80211: do link->MLD address translation on RX


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
