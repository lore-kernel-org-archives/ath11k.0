Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGge0-0008Av-Aa
 for ath11k@lists.infradead.org; Wed, 17 Apr 2019 09:14:17 +0000
MIME-Version: 1.0
Date: Wed, 17 Apr 2019 02:14:15 -0700
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH 2/2] ath11k: add TWT support
In-Reply-To: <20190416190840.20286-2-john@phrozen.org>
References: <20190416190840.20286-1-john@phrozen.org>
 <20190416190840.20286-2-john@phrozen.org>
Message-ID: <1987e719d39c919bb1e6f660cfc3d49d@codeaurora.org>
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
To: John Crispin <john@phrozen.org>
Cc: ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>, Shashidhar Lakkavalli <slakkavalli@datto.com>

On 2019-04-16 12:08, John Crispin wrote:
> Add target wait time wmi calls to the driver. Enable the support inside
> the FW by default.
> 
Cool... Are you planning to provide option to disable and enable TWT 
through hostapd.

Also ath11k may need user interface to add/remove and pause/resume TWT 
dialog for
given peer. no?

-Rajkumar

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
