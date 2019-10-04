Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGKR1-0002LZ-Qa
 for ath11k@lists.infradead.org; Fri, 04 Oct 2019 10:03:41 +0000
Subject: Re: [PATCH] ath11k: optimize RX path latency
References: <20191004100156.24354-1-john@phrozen.org>
From: John Crispin <john@phrozen.org>
Message-ID: <f97fa2f8-1904-1dc6-99d7-c87e66e8409b@phrozen.org>
Date: Fri, 4 Oct 2019 12:03:37 +0200
MIME-Version: 1.0
In-Reply-To: <20191004100156.24354-1-john@phrozen.org>
Content-Language: en-US
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
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org


On 04/10/2019 12:01, John Crispin wrote:
> Pegging the processing on a specific core and running perf --top we get
> the following output when running HE80 at a fixed bandwisth of 1gbit.
s/bandwisth/bandwidth/g

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
